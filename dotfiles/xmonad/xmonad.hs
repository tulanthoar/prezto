import Control.Monad
import Data.List
import Data.Map(fromList)
import Data.Maybe(fromMaybe)
import Data.Ratio((%))
import System.IO(hPutStrLn)
import XMonad
import XMonad.Actions.Commands
import XMonad.Actions.CycleWS
import XMonad.Actions.FocusNth
import XMonad.Actions.GridSelect
import XMonad.Actions.ShowText
import XMonad.Actions.SpawnOn
import XMonad.Actions.TagWindows
import XMonad.Actions.UpdatePointer
import XMonad.Actions.WithAll
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.Minimize
import XMonad.Hooks.ServerMode
import XMonad.Hooks.SetWMName
import XMonad.Layout.BoringWindows
import XMonad.Layout.Minimize
import XMonad.Layout.NoBorders
import XMonad.Layout.Reflect
import XMonad.Layout.ToggleLayouts
import qualified XMonad.Layout.Gaps as G
import qualified XMonad.Layout.GridVariants as GV
import qualified XMonad.Layout.Magnifier as Mag
import XMonad.ManageHook
import XMonad.Prompt
import XMonad.Prompt.AppendFile
import XMonad.Prompt.AppLauncher
import qualified XMonad.StackSet as W
import qualified XMonad.Util.Dzen as D
import qualified XMonad.Util.Loggers as L
import XMonad.Util.Dmenu
import XMonad.Util.EZConfig(additionalKeysP, additionalKeys)
import XMonad.Util.NamedScratchpad
import XMonad.Util.Paste
import XMonad.Util.Run(safeSpawn,spawnPipe, runProcessWithInputAndWait)
import XMonad.Util.SpawnOnce

myTerminal = "urxvt" :: String
myModMask = mod3Mask :: KeyMask
wmNameM_ = setWMName "LG3D" :: X()
uniqueInits = ["sudo updatedb", "modkey"] :: [String]
xInits = words "maybeclipmenud mayberedshift" :: [String]
xInitM_ = mapM_ spawnOnce (uniqueInits++xInits)
wsList =  map (\w -> "<"++w++">") ["W", "d", "t", "T"] :: [String]
menuH=15 :: Int
mvNEmpty = moveTo Next EmptyWS :: X()
mvPEmpty = moveTo Prev EmptyWS :: X()

mylayoutHook = G.gaps [(G.U,menuH)] $ smartBorders $ Mag.magnifiercz 1.4 $
  boringAuto $ minimize $ toggleLayouts (GV.SplitGrid GV.T 1 2 (1%2) (16%10) delta) $ Tall 1 delta ratio
  where
    delta = 3 % 100
    ratio = 11 % 20

-- Manage hook
myManageHook = namedScratchpadManageHook scratchpads
  <+> composeAll
  [ className =? "Xmessage"  --> doFloat
  , className =? "Dialogue"  --> doFloat
  ]
  <+> (fmap not isDialog --> doF avoidMaster)
  <+> composeOne [ isFullscreen -?> doFullFloat ]
  <+> manageDocks

xmConf p = def
  { manageHook         = manageSpawn <+> myManageHook <+> def
  , layoutHook         = mylayoutHook
  , startupHook        = return()>>wmNameM_>> xInitM_ >> mapM_ (namedScratchpadAction scratchpads) [iPad, pPad, nPad, rPad]
  , terminal           = myTerminal
  , modMask            = myModMask
  , borderWidth        = 0
  , focusFollowsMouse  = True
  , normalBorderColor  = cDkDkGray
  , focusedBorderColor = limeGreen
  , workspaces         = wsList
  , logHook            = dynamicLogWithPP ( myDzenPP p ) >> updatePointer (0.5, 0.5) (0, 0)
  , handleEventHook = docksEventHook <+> minimizeEventHook <+> handleTimerEvent <+> serverModeEventHook <+> serverModeEventHookCmd' xmC
  , keys = \c -> fromList xkM
  }

main :: IO()
main = do
  dzP <- spawnPipe $ "dzen2 -h "++show menuH++" -ta c -p"
  xmonad $ xmConf dzP
    `additionalKeysP` myKeysP

xkM=
  [ ((0, xK_Menu), launchAct)
  , ((0, 0x1008ff17), spawn "echo `xsel -o` >> /tmp/urxvt-python.fifo")
  , ((0, 0x1008ff16), appendFilePrompt defaultXPConfig "/tmp/urxvt-python.fifo")
  , ((0, kKPenter), withFocused $ \w -> withAll minimizeWindow >> (sendMessage . RestoreMinimizedWin ) w )
  , ((0, kKPminus), withFocused minimizeWindow)
  , ((0, kKPzero), goToSelected defaultGSConfig)
  , ((0, kKPdot), sendMessage ToggleLayout)
  , ((0, kKPplus), sendMessage RestoreNextMinimizedWin )
  , ((0, kKPmute), spawn "systemctl suspend")
  , ((mod1Mask, lowvol), focusUp)
  , ((mod1Mask, raisevol),  focusDown)
  , ((0, lowvol), replicateM_ 5 $ sendKey noModMask xK_Up)
  , ((0, raisevol), replicateM_ 5 $ sendKey noModMask xK_Down)
  , ((0, xK_Print),withFocused $ hasTag "myterm" >=> \b -> if b then sendKey controlMask xK_F9 else sendKey controlMask xK_F10)
  , ((myModMask, lowvol), moveTo Next NonEmptyWS >> avoidNSP)
  , ((myModMask, raisevol), moveTo Prev NonEmptyWS >> avoidNSP)
  , ((myModMask, xK_Menu), srchAct)
  ] ++
  [ ((0, k), focusNth w)
    | (w, k) <- zip [0 .. 8] [xK_KP_End, 0xff99, 0xff9b, 0xff96, 0xff9d, 0xff98, 0xff95, 0xff97, 0xff9a ]
  ] ++
  [ ((myModMask, k), focusNth w)
    | (w, k) <- zip [9 .. 17] [xK_KP_End, 0xff99, 0xff9b, 0xff96, 0xff9d, 0xff98, 0xff95, 0xff97, 0xff9a ]
  ]
myKeysP =
  [ ("M4-t",  spawn $ myTerminal ++ " -name " ++ myTerminal ++ " -n " ++ myTerminal)
  , ("M4-<Space>", spawn "touch ~/.pomodoro_session" >> spawn "/home/ant/bin/start-pomodoro")
  , ("<Insert>", spawn "xdotool click 2")
  , ("M-c", spawn "clipmenu -z -w 800 -l 50 -p 'clip'")
  , ("M-<Down>", withFocused $ \w -> withAll minimizeWindow >> sendMessage (RestoreMinimizedWin w))
  , ("M-h", mvPEmpty >> avoidNSP)
  , ("M-l", mvNEmpty >> avoidNSP)
  , ("M-j", withFocused minimizeWindow)
  , ("M-k", sendMessage RestoreNextMinimizedWin)
  , ("M-m", sendMessage Mag.Toggle )
  , ("M-<Left>", shiftTo Prev EmptyWS)
  , ("M-<Right>", shiftTo Next EmptyWS)
  , ("M-q",       spawn "killall dzen2; xmonad --recompile && xmonad --restart" )
  , ("M-r",       refresh)
  , ("M-<Space>", mvNEmpty >> avoidNSP >> spawn dmRun)
  , ("M-<Tab>", toggleWS' ["NSP"])
  , ("M-t",  spawn $ myTerminal ++ " -name " ++ init myTerminal ++ " -n " ++ init myTerminal)
  , ("M4-h", namedScratchpadAction scratchpads hPad)
  , ("M4-a", mapM_ (namedScratchpadAction scratchpads) [iPad, pPad, nPad, rPad])
  , ("M4-i i",  namedScratchpadAction scratchpads iPad)
  , ("M4-i <Space>", appendFilePrompt defaultXPConfig "/tmp/urxvt-python.fifo")
  , ("M4-i <Insert>", spawn "echo `xsel -o` >> /tmp/urxvt-python.fifo")
  , ("M4-i <Return>", spawn "echo '\r' >> /tmp/urxvt-python.fifo")
  , ("M4-n n",  namedScratchpadAction scratchpads "neovim")
  , ("M4-n <Space>", spawn "echo 'A' >> /tmp/urxvt-neovi.fifo" >> appendFilePrompt defaultXPConfig "/tmp/urxvt-neovi.fifo" >> spawn "echo 'jf' >> /tmp/urxvt-neovi.fifo")
  , ("M4-n <Insert>", spawn "echo A`xsel -o`jf >> /tmp/urxvt-neovi.fifo")
  , ("M4-n <Return>", spawn "echo '\r' >> /tmp/urxvt-neovi.fifo")
  , ("M4-p p",  namedScratchpadAction scratchpads pPad)
  , ("M4-p <Space>", appendFilePrompt defaultXPConfig "/tmp/urxvt-per.fifo" )
  , ("M4-p <Insert>", spawn "echo `xsel -o` >> /tmp/urxvt-per.fifo")
  , ("M4-p <Return>", spawn "echo '\r' >> /tmp/urxvt-per.fifo")
  , ("M4-b b", withTaggedGlobalP "myterm" shiftHere >> focusUpTaggedGlobal "myterm")
  , ("M4-b x", withTaggedP "myterm" (W.shiftWin "NSP"))
  , ("M4-b <Insert>", spawn "echo `xsel -o` >> /tmp/urxv.fifo")
  , ("M4-b <Space>", appendFilePrompt defaultXPConfig "/tmp/urxv.fifo")
  , ("M4-r r",  namedScratchpadAction scratchpads rPad)
  , ("M4-r <Space>", appendFilePrompt defaultXPConfig "/tmp/urxvt-range.fifo")
  , ("M4-n <Insert>", spawn "echo `xsel -o` >> /tmp/urxvt-range.fifo")
  , ("M4-n <Return>", spawn "echo '\r' >> /tmp/urxvt-range.fifo")
  ]

myBrowser = "qutebrowser"
launchAct = flashText def 4 "launch app" >> spawn dmRun :: X()
srchAct = flashText def 4 "search engine" >> spawn dmSrch :: X()
avoidNSP = replicateM_ 2 $ toggleWS' ["NSP"] :: X()
dmRun = "j4-dmenu-desktop --display-binary --term="++myTerminal++" --dmenu='dmenu -w 600 -y "++show menuH++" -z -p launch -l 50'"
dmSrch = "srsearch -w 600 -x 200 -y "++show menuH++" -z -p 'search' -l 50"

mC =
  [ ("minone", withFocused minimizeWindow )
  , ("tagterm", withFocused (addTag "myterm"))
  , ("rest",  sendMessage RestoreNextMinimizedWin )
  , ("addpipe", sendKey mod4Mask xK_f )
  ]
xmC = return mC
scratchpads =
  [ NS hPad "urxvt -e htop" (title =? "htop") nonFloating
  , NS iPad pyrepl (icon =? init iPad) nonFloating
  , NS nPad nRun (icon =? init nPad) nonFloating
  , NS rPad rRun (icon =? init rPad) nonFloating
  , NS pPad prepl (icon =? init pPad) nonFloating
  , NS myBrowser myBrowser (className =? "qutebrowser") nonFloating
  ]
iPad = "ipy"
pPad = "perl"
nPad = "neovim"
rPad = "ranger"
hPad = "htop"
nRun = urtRun nPad "nvim ~/buffer"
rRun = urtRun rPad "ranger"
urtRun ex cmd = concat [myTerminal, " -name ", init ex," -n ", init ex, " -e ", cmd]
prepl = urtRun pPad "re.pl"
pyrepl= urtRun iPad "ptipython"
icon = stringProperty "WM_ICON_NAME"
myDzenPP p = def
  { ppCurrent         = dzenColor myFFGColor myFBGColor
  , ppVisible         = dzenColor myVFGColor myVBGColor
  , ppHidden          = dzenColor myHFGColor myHBGColor . \w -> if w /= "NSP" then w else ""
  , ppHiddenNoWindows = dzenColor myHNFGColor myHNBGColor
  , ppUrgent          = dzenColor myUFGColor myUBGColor
  , ppTitle           = dzenColor myTFGColor myTBGColor . trim . shorten 100
  , ppLayout          = dzenColor myLFGColor myLBGColor . shorten 0
  , ppSep             = dzenColor sepFGColor sepBGColor " -||- "
  , ppExtras          = [L.date "%a %b %d", L.logCmd "diskspace", L.logCmd "coretemp", L.logCmd "pymodoro-out"]
  , ppOutput          = hPutStrLn p }

kKPplus=0xffab
kKPdot=0xff9f
kKPzero=0xff9e
kKPminus=0xffad
raisevol=0x1008ff13
lowvol=0x1008ff11
kKPmute=0x1008ff12
kKPenter=0xff8d
apFn pt = "-*-monofur-medium-r-*-*-"++pt++"-*-*-*-*-*-*-*" :: String
apFnmenu = apFn "16"

-- Avoid changing master on new window creation
avoidMaster :: W.StackSet i l a s sd -> W.StackSet i l a s sd
avoidMaster = W.modify' $ \c -> case c of
  W.Stack t [] (r:rs) -> W.Stack t [r] rs
  _ -> c

data DzenCfg = DzenCfg{ x :: String
                      , y :: String
                      , h :: String
                      , w :: String
                      -- , ta :: String
                      -- , bg :: String
                      -- , fn :: String
                      } deriving( Show )

dzenArgP :: DzenCfg -> [[String]]
dzenArgP c = [["-x ","-y ","-h ","-w "],[x c, y c, h c, w c]]
dzenArgs :: [[String]] -> [String]
dzenArgs p = map concat $ transpose p
testCfg :: DzenCfg
testCfg = DzenCfg{x="0", y="300", h="20",w="400" }
testArgs :: [String]
testArgs = dzenArgs.dzenArgP $ testCfg
limeGreen = "#a3d930" :: String
ltBlue = "#1793d1" :: String
cBlack = "#000000" :: String
cDkGray = "#1a1a1a" :: String
cDkDkGray = "#121212" :: String
cOrange = "#ffbf00" :: String
cLtOrange = "#ffe699" :: String
cBlue = "#3399ff" :: String
cDkPurp = "#330033" :: String
cGreen = "#009900" :: String
cWhite = "#ffffff" :: String
cDkOrange = "#662900" :: String

myDBGColor = cDkPurp :: String

myFFGColor = myHBGColor :: String
myFBGColor = myHFGColor :: String
myVFGColor = myHNBGColor :: String
myVBGColor = myHNFGColor :: String
myHFGColor = cOrange :: String
myHBGColor = myDBGColor :: String
myHNFGColor = cDkOrange :: String
myHNBGColor = myDBGColor :: String
myUFGColor = myFFGColor :: String
myUBGColor = cBlack :: String

myTFGColor = cGreen :: String
myTBGColor = myDBGColor :: String
myLFGColor = cBlue :: String
myLBGColor = myDBGColor :: String

sepFGColor = cWhite :: String
sepBGColor = myDBGColor :: String
-- dzenBarCfg = D.dzenConfig (D.addArgs ["-h 18", "-ta c", "-bg myDBGColor"] >=> D.timeout 10 >=> D.x 0 >=> D.y 299)
  -- , ((mod4Mask.|.controlMask, xK_p), spawn (intercalate " " (["dzen2"]++testArgs++ ["-title-name","'hi'","-p ","10"]) ))
  -- , ((mod4Mask, xK_p), D.dzenConfig (D.timeout 10) $ "xmessage " ++ (intercalate " " (["dzen2"]++testArgs++ ["-title-name","'hi'"]) ))
  -- , ((0, 0x1008ff14), dzenBarCfg "testing123")
  -- , ((0, xK_Print), spawn "sleep 1 && xdotool key F12 F10")
  -- , ((myModMask .|. controlMask, xK_y), defaultCommands >>= runCommand)
