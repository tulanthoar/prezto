import XMonad.Actions.SpawnOn
import XMonad.Prompt
import XMonad.Prompt.AppendFile
import Data.List
import Control.Monad
import Data.Maybe(fromMaybe)
import Data.Ratio((%))
import qualified Data.Map as M
import System.IO(hPutStrLn)
import XMonad
import XMonad.ManageHook
import XMonad.Prompt
import qualified XMonad.StackSet as W
import XMonad.Actions.Commands
import XMonad.Actions.CycleWS
import XMonad.Actions.FocusNth
import XMonad.Actions.GridSelect
import XMonad.Actions.ShowText
import XMonad.Actions.UpdatePointer
import XMonad.Actions.WithAll
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.Minimize
import XMonad.Hooks.ServerMode
import XMonad.Hooks.SetWMName
import XMonad.Layout.BoringWindows
import qualified XMonad.Layout.Gaps as G
import qualified XMonad.Layout.GridVariants as GV
import XMonad.Layout.Magnifier
import XMonad.Layout.Minimize
import XMonad.Layout.NoBorders
import XMonad.Layout.Reflect
import XMonad.Layout.ToggleLayouts
import XMonad.Prompt.AppLauncher
import XMonad.Util.Dmenu
import qualified XMonad.Util.Dzen as D
import XMonad.Util.EZConfig(additionalKeysP, additionalKeys)
import qualified XMonad.Util.Loggers as L
import XMonad.Util.NamedScratchpad
import XMonad.Util.Paste
import XMonad.Util.Run(safeSpawn,spawnPipe, runProcessWithInputAndWait)
import XMonad.Util.SpawnOnce

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

myTerminal = "urxvtc" :: String
myModMask = mod3Mask :: KeyMask

xmConf p = def
  { manageHook         = manageSpawn <+> myManageHook <+> def
  , layoutHook         = mylayoutHook
  , startupHook        = return() >> mapM_ spawn ["sudo updatedb", "maybeclipmenud.sh", "mayberedshift.sh" ] >> setWMName "LG3D" >> spawnOnce "modkey" >> spawn "ipyterm" >> spawn "nvterm" >> spawn "maybeperlrepl"
  , terminal           = myTerminal
  , modMask            = myModMask
  , borderWidth        = 0
  , focusFollowsMouse  = True
  , normalBorderColor  = cDkDkGray
  , focusedBorderColor = limeGreen
  , workspaces         = map (\w -> "<"++w++">") ["W", "d", "t", "T"]
  , logHook            = updatePointer (0.5,0.5) (0.5,0.5) >> dynamicLogWithPP ( myDzenPP p )
  , handleEventHook = docksEventHook <+> minimizeEventHook <+> handleTimerEvent <+> serverModeEventHook <+> serverModeEventHookCmd' xmC
  , keys = \c -> M.fromList xkM
  }

dzenBarCfg = D.dzenConfig (D.addArgs ["-h 18", "-ta c", "-bg myDBGColor"] >=> D.timeout 10 >=> D.x 0 >=> D.y 299)

main :: IO()
main = do
  dzP <- spawnPipe "dzen2 -h 15 -ta c -p"
  xmonad $ xmConf dzP
    `additionalKeysP` myKeysP

mylayoutHook = G.gaps [(G.U,15)] $ smartBorders $ magnifiercz 1.4 $
  boringAuto $ minimize $ toggleLayouts (GV.SplitGrid GV.T 1 2 (1%2) (16%10) delta) $ Tall 1 delta ratio
  where
    delta = 3 % 100
    ratio = 11 % 20

-- Manage hook
myManageHook = namedScratchpadManageHook scratchpads
  <+> composeAll
  [ className =? "Xmessage"  --> doFloat
  ,className =? "Dialogue"  --> doFloat
  ,icon =? "pyscratch" --> doShift "NSP"
  ]
  <+> (fmap not isDialog --> doF avoidMaster)
  <+> composeOne [ isFullscreen -?> doFullFloat ]
  <+> manageDocks
terminus = "-*-monofur-*-*-*-*-22-*-*-*-*-*-*-*"
xkM=
  [ ((0, xK_Menu), launchAct)
  , ((0, 0x1008ff17), spawn "echo `xsel -o` > /tmp/urxvt-python.fifo")
  , ((0, 0x1008ff16), appendFilePrompt defaultXPConfig "/tmp/urxvt-python.fifo")
  , ((0, k_kp_enter), withFocused $ \w -> withAll minimizeWindow >> (sendMessage . RestoreMinimizedWin ) w )
  , ((0, k_kp_minus), withFocused minimizeWindow)
  , ((0, k_kp_zero), goToSelected defaultGSConfig)
  , ((0, k_kp_dot), sendMessage ToggleLayout)
  , ((0, k_kp_plus), sendMessage RestoreNextMinimizedWin )
  , ((0, k_mute), spawn "systemctl suspend")
  , ((mod1Mask, lowvol), focusUp)
  , ((mod1Mask, raisevol),  focusDown)
  , ((0, lowvol), replicateM_ 5 $ sendKey noModMask xK_Up)
  , ((0, raisevol), replicateM_ 5 $ sendKey noModMask xK_Down)
  , ((0, xK_Print), sendKey controlMask xK_F10 )
  , ((myModMask .|. controlMask, xK_y), defaultCommands >>= runCommand)
  , ((myModMask, lowvol), moveTo Next NonEmptyWS >> avoidNSP)
  , ((myModMask, raisevol), moveTo Prev NonEmptyWS >> avoidNSP)
  , ((myModMask, xK_F1), dmenuchoose $ M.fromList mC)
  , ((myModMask, xK_Menu), srchAct)
  , ((myModMask, xK_v), sendKey controlMask xK_F11 >> sendKey noModMask xK_space)
  , ((myModMask, xK_y), sendKey noModMask xK_Return >> sendKey noModMask xK_F10)
  , ((mod4Mask.|.controlMask, xK_p), spawn (intercalate " " (["dzen2"]++testArgs++ ["-title-name","'hi'","-p ","10"]) ))
  , ((mod4Mask, xK_p), D.dzenConfig (D.timeout 10) $ "xmessage " ++ (intercalate " " (["dzen2"]++testArgs++ ["-title-name","'hi'"]) ))
  , ((0, 0x1008ff14), dzenBarCfg "testing123")
  ] ++
  [ ((0, k), focusNth w)
    | (w, k) <- zip [0 .. 8] [xK_KP_End, 0xff99, 0xff9b, 0xff96, 0xff9d, 0xff98, 0xff95, 0xff97, 0xff9a ]
  ] ++
  [ ((myModMask, k), focusNth w)
    | (w, k) <- zip [9 .. 17] [xK_KP_End, 0xff99, 0xff9b, 0xff96, 0xff9d, 0xff98, 0xff95, 0xff97, 0xff9a ]
  ]

k_kp_plus=0xffab
k_kp_dot=0xff9f
k_kp_zero=0xff9e
k_kp_minus=0xffad
raisevol=0x1008ff13
lowvol=0x1008ff11
k_mute=0x1008ff12
k_kp_enter=0xff8d

myKeysP =
  [ ("M4-t",  spawn myTerminal )
  , ("M4-<Space>", spawn "touch ~/.pomodoro_session" >> spawn "/home/ant/.pymodoro/hooks/start-pomodoro.py")
  , ("<Insert>", spawn "xdotool click 2")
  -- , ("M-b", namedScratchpadAction scratchpads myBrowser)
  , ("M-c", spawn $ "clipmenu -z -l 50 -p 'clip' -fn "++apFnmenu)
  , ("M-<Down>", withFocused $ \w -> withAll minimizeWindow >> sendMessage (RestoreMinimizedWin w))
  , ("M-h", moveTo Prev NonEmptyWS >> avoidNSP)
  , ("M-j", withFocused minimizeWindow)
  , ("M-k", sendMessage RestoreNextMinimizedWin)
  , ("M-<Left>", shiftTo Prev EmptyWS)
  , ("M-l", moveTo Next NonEmptyWS >> avoidNSP)
  -- , ("M-n",     sendMessage ToggleLayout)
  , ("M-o i m g", launchApp def "gimp" )
  , ("M-o p d f", launchApp def "evince" )
  , ("M-q",       spawn "killall dzen2; xmonad --recompile && xmonad --restart" )
  , ("M-<Right>", shiftTo Next EmptyWS)
  , ("M-r",       refresh)
  , ("M-<Space>", moveTo Next EmptyWS >> avoidNSP >> spawn dmRun)
  , ("M-<Tab>", toggleWS' ["NSP"])
  , ("M-t",  spawn myTerminal)
  , ("M-x h",  namedScratchpadAction scratchpads "htop")
  , ("M-x i",  namedScratchpadAction scratchpads "python")
  , ("M-i i",  namedScratchpadAction scratchpads "python" >> sendKey noModMask xK_Return)
  , ("M-i <Space>", appendFilePrompt defaultXPConfig "/tmp/urxvt-python.fifo")
  , ("M-i <Insert>", spawn "echo `xsel -o` > /tmp/urxvt-python.fifo")
  , ("M-x n",  namedScratchpadAction scratchpads "neovim")
  , ("M-n n",  namedScratchpadAction scratchpads "neovim" >> sendKey noModMask xK_j >> sendKey noModMask xK_f)
  , ("M-n <Space>", spawn "echo 'A' > /tmp/urxvt-neovi.fifo" >> appendFilePrompt defaultXPConfig "/tmp/urxvt-neovi.fifo" >> spawn "echo 'jf' > /tmp/urxvt-neovi.fifo")
  , ("M-n <Insert>", spawn "echo A`xsel -o`jf > /tmp/urxvt-neovi.fifo")
  , ("M-x p",  namedScratchpadAction scratchpads "perl")
  , ("M-p p",  namedScratchpadAction scratchpads "perl")
  , ("M-p <Space>", appendFilePrompt defaultXPConfig "/tmp/urxvt-per.fifo" )
  , ("M-p <Insert>", spawn "echo `xsel -o` > /tmp/urxvt-per.fifo")
  ]
myBrowser = "qutebrowser"

mC =
  [ ("minone", withFocused minimizeWindow )
  , ("rest",  sendMessage RestoreNextMinimizedWin )
  , ("nspy", namedScratchpadAction scratchpads "python")
  , ("pyspawn", spawnOn "<t>" "urxvt -name ipython -n pyscratch -e ptipython")
  , ("nvspawn", spawnOn "<t>" "urxvt -name neovi -n neovi -e nvim ~/buffer")
  , ("pespawn", spawnOn "<t>" "urxvt -name per -n per -e perl ~/bin/re2.pl")
  , ("addpipe", sendKey mod4Mask xK_f )
  , ("addpypipe", namedScratchpadAction scratchpads "python" >> sendKey mod4Mask xK_f >> namedScratchpadAction scratchpads "python")
  , ("addnvpipe", namedScratchpadAction scratchpads "neovim" >> sendKey mod4Mask xK_f >> namedScratchpadAction scratchpads "neovim")
  , ("addpepipe", namedScratchpadAction scratchpads "perl" >> sendKey mod4Mask xK_f >> namedScratchpadAction scratchpads "perl")
  ]
xmC = return mC
dmenuchoose m = dmenuMap m >>= fromMaybe (return ())
scratchpads =
  [ NS "htop" "urxvt -e htop" (title =? "htop") nonFloating
  , NS "python" "urxvt -name ipython -n pyscratch -e ptipython" (icon =? "pyscratch") nonFloating
  , NS "neovim" "urxvt -name neovi -n neovi -e nvim ~/buffer" (icon =? "neovi") nonFloating
  , NS "perl" "urxvt -name per -n per -e perl ~/bin/re2.pl" (icon =? "per") nonFloating
  , NS myBrowser myBrowser (className =? "qutebrowser") nonFloating
  ]
icon = stringProperty "WM_ICON_NAME"
myDzenPP p = def
  { ppCurrent         = dzenColor myFFGColor myFBGColor
  , ppVisible         = dzenColor myVFGColor myVBGColor
  , ppHidden          = dzenColor myHFGColor myHBGColor . \w -> if w /= "NSP" then w else ""
  , ppHiddenNoWindows = dzenColor myHNFGColor myHNBGColor
  , ppUrgent          = dzenColor myUFGColor myUBGColor
  , ppTitle           = dzenColor myTFGColor myTBGColor . trim . shorten 100
  , ppLayout          = dzenColor myLFGColor myLBGColor
  , ppSep             = dzenColor sepFGColor sepBGColor " -||- "
  , ppExtras          = [L.date "%a %b %d", L.logCmd "mypymodoro",  L.logCmd "diskspace.sh", L.logCmd "coretemp"]
  , ppOutput          = hPutStrLn p }

launchAct = flashText def 4 "launch app" >> spawn dmRun :: X()
avoidNSP = replicateM_ 2 $ toggleWS' ["NSP"] :: X()
srchAct = flashText def 4 "search engine" >> spawn dmSrch :: X()
dmRun = "dmenu_run -w 300 -y 20 -z -p 'launch' -l 60 -fn "++apFnmenu++" "::String
dmSrch = "search.sh -w 600 -y 20 -z -p 'search' -l 60 -fn "++apFnmenu++" "::String
apFn pt = "-*-monofur-bold-r-*-*-"++pt++"-*-*-*-*-*-*-*" :: String
apFnmenu = apFn "16"

-- Avoid changing master on new window creation
avoidMaster :: W.StackSet i l a s sd -> W.StackSet i l a s sd
avoidMaster = W.modify' $ \c -> case c of
  W.Stack t [] (r:rs) -> W.Stack t [r] rs
  _ -> c

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
