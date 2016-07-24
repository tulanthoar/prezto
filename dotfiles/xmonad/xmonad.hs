import Control.Monad
import Data.List
import Data.Map(fromList)
import Data.Maybe(fromMaybe)
import Data.Ratio((%))
import qualified XMonad.Layout.Gaps as G
import qualified XMonad.Layout.GridVariants as GV
import qualified XMonad.Layout.Magnifier as M
import qualified XMonad.StackSet as W
import qualified XMonad.Util.Dzen as D
import qualified XMonad.Util.Loggers as L
import System.IO(hPutStrLn)
import XMonad
import XMonad.Actions.Commands
import XMonad.Actions.CycleWS
import XMonad.Actions.FocusNth
import XMonad.Actions.GridSelect
import XMonad.Actions.TagWindows
import XMonad.Actions.UpdatePointer (updatePointer)
import XMonad.Actions.WithAll
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.Minimize
import XMonad.Hooks.ServerMode
import XMonad.Hooks.SetWMName
import XMonad.Layout.BoringWindows
import XMonad.Layout.Minimize
import XMonad.Layout.NoBorders
-- import XMonad.Layout.Reflect
import XMonad.Layout.ToggleLayouts
import XMonad.Hooks.WorkspaceHistory (workspaceHistoryHook)
import XMonad.ManageHook
import XMonad.Prompt
import XMonad.Prompt.AppendFile
-- import XMonad.Prompt.AppLauncher
import XMonad.Util.Dmenu
import XMonad.Util.EZConfig(additionalKeys, additionalKeysP)
import XMonad.Util.NamedScratchpad
import XMonad.Util.Paste
import XMonad.Util.Run(safeSpawn,spawnPipe, runProcessWithInputAndWait)
import XMonad.Util.SpawnOnce
import XMonad.Util.XUtils

myTerminal = "urxvt" :: String
myModMask = mod3Mask :: KeyMask
wmNameM_ = setWMName "LG3D" :: X()
uniqueInits = ["sudo updatedb", "modkey", "tilda -c xmenu", "maybeclipmenud", "mayberedshift"] :: [String]
xInitM_ = mapM_ spawnOnce uniqueInits
wsList =  map (\w -> "<"++w++">") ["W", "d", "t", "T"] :: [WorkspaceId]
menuH = 15 :: Int
magFactor = 1.2 :: Rational
mvNEmpty = moveTo Next EmptyWS :: X()
mvNNEmpty = moveTo Next NonEmptyWS :: X()
mvPNEmpty = moveTo Prev NonEmptyWS :: X()
corePadsM_ = mapM_ (namedScratchpadAction scratchpads) [iPad, pPad, nPad, rPad] :: X()
myBrowser = "qutebrowser" :: String
launchAct = spawn dmRun :: X()
srchAct = spawn dmSrch :: X()
dmRun = "j4-dmenu-desktop --display-binary --term="++myTerminal++" --dmenu='dmenu -w 600 -y "++show menuH++" -z -p launch -l 50'" :: String
dmSrch = "srsearch -w 600 -x 200 -y "++show menuH++" -z -p 'search' -l 50" :: String

mylayoutHook = boringAuto $ G.gaps [(G.U,menuH)] $ M.magnifiercz magFactor $
  minimize $ toggleLayouts (GV.SplitGrid GV.T 1 2 (1%2) (16%10) delta) $ Tall 1 delta ratio
  where
    delta = 3 % 100
    ratio = 11 % 20
-- Manage hook
myManageHook = namedScratchpadManageHook scratchpads <+> manageDocks
  <+> composeOne [ isFullscreen -?> doFullFloat ]
  <+> composeAll
  [ className =? "Xmessage"  --> doFloat
  , className =? "stmenu" --> doFloat
  , className =? "Tilda" --> doFloat
  ]

xmConf p = ewmh $ def
  { manageHook         = myManageHook <+> def
  , layoutHook         = mylayoutHook
  , startupHook        = return() >> wmNameM_ >> xInitM_ >> corePadsM_
  , terminal           = myTerminal
  , modMask            = myModMask
  , borderWidth        = 0
  , focusFollowsMouse  = False
  , normalBorderColor  = cDkDkGray
  , focusedBorderColor = limeGreen
  , workspaces         = wsList
  , logHook            = dynamicLogWithPP ( myDzenPP p ) >> workspaceHistoryHook >> updatePointer (0.5, 0.5) (0, 0)
  , handleEventHook    = docksEventHook <+> minimizeEventHook <+> serverModeEventHookCmd' xmC <+> fullscreenEventHook
  , keys               = \c -> fromList xkM
  }

main :: IO()
main = do
  dzP <- spawnPipe $ "dzen2 -h "++show menuH++" -ta c -p"
  xmonad $ xmConf dzP
    `additionalKeysP` myKeysP

restoreFocused = withFocused ( sendMessage . RestoreMinimizedWin ) :: X()
xkM=
  [ ((0, kKPenter), withFocused $ \w -> withAll minimizeWindow >> (sendMessage . RestoreMinimizedWin ) w )
  , ((0, kKPminus), withFocused minimizeWindow)
  , ((0, kKPzero), goToSelected def >> restoreFocused)
  , ((0, kKPdot), sendMessage ToggleLayout)
  , ((0, kKPplus), sendMessage RestoreNextMinimizedWin )
  , ((0, kKPmute), spawn "systemctl suspend")
  , ((0, lowvol), replicateM_ 5 $ sendKey noModMask xK_Up)
  , ((0, raisevol), replicateM_ 5 $ sendKey noModMask xK_Down)
  , ((mod4Mask, xK_y), sendKey controlMask xK_F9)
  , ((myModMask, lowvol), moveTo Next (WSIs $ return (('<' `elem`) . W.tag)))
  , ((myModMask, raisevol), moveTo Prev (WSIs $ return (('<' `elem`) . W.tag)))
  ] ++
  [ ((0, k), focusNth w)
    | (w, k) <- zip [0 .. 8] [xK_KP_End, 0xff99, 0xff9b, 0xff96, 0xff9d, 0xff98, 0xff95, 0xff97, 0xff9a ]
  ]
myKeysP =
  [ ("<Insert>", spawn "xdotool click 2")
  , ("M-c", clipcmd)
  , ("M-h", moveTo Prev (WSIs $ return (('<' `elem`) . W.tag)))
  , ("M-l", moveTo Next (WSIs $ return (('<' `elem`) . W.tag)))
  , ("M-j", withFocused minimizeWindow)
  , ("M-k", sendMessage RestoreNextMinimizedWin)
  , ("M-<Left>", shiftTo Prev EmptyWS)
  , ("M-<Right>", shiftTo Next EmptyWS)
  , ("M-q",       spawn "killall dzen2; xmonad --recompile && xmonad --restart" )
  , ("M-<Tab>", toggleWS' ["NSP"])
  , ("M-t",  byobucmd )
  , ("M4-i <Space>", appendFilePrompt def "/tmp/urxvt-python.fifo")
  , ("M4-i <Insert>", spawn "echo `xsel -o` >> /tmp/urxvt-python.fifo")
  , ("M4-i <Return>", spawn "echo '\r' >> /tmp/urxvt-python.fifo")
  , ("M4-n <Space>", spawn "echo 'A' >> /tmp/urxvt-neovi.fifo" >> appendFilePrompt def "/tmp/urxvt-neovi.fifo" >> spawn "echo 'jf' >> /tmp/urxvt-neovi.fifo")
  , ("M4-n <Insert>", spawn "echo A`xsel -o`jf >> /tmp/urxvt-neovi.fifo")
  , ("M4-n <Return>", spawn "echo '\r' >> /tmp/urxvt-neovi.fifo")
  , ("M4-p <Space>", appendFilePrompt def "/tmp/urxvt-per.fifo" )
  , ("M4-p <Insert>", spawn "echo `xsel -o` >> /tmp/urxvt-per.fifo")
  , ("M4-p <Return>", spawn "echo '\r' >> /tmp/urxvt-per.fifo")
  , ("M4-b <Insert>", spawn "echo `xsel -o` >> /tmp/urxv.fifo")
  , ("M4-b <Space>", appendFilePrompt def "/tmp/urxv.fifo")
  , ("M4-r <Space>", appendFilePrompt def "/tmp/urxvt-range.fifo")
  , ("M4-r <Insert>", spawn "echo `xsel -o` >> /tmp/urxvt-range.fifo")
  , ("M4-r <Return>", spawn "echo '\r' >> /tmp/urxvt-range.fifo")
  ]
clipcmd = spawn "clipmenu -z -w 800 -l 50 -p 'clip'"
byobucmd = spawn $ urtRun myTerminal "/bin/zsh -c 'sleep 1; xmctl tagterm && byobu-tmux new-session'"
mC =
  [ ("minone", withFocused minimizeWindow )
  , ("tagterm", withFocused $ addTag "myterm")
  , ("rest",  sendMessage RestoreNextMinimizedWin )
  , ("jmenu", launchAct )
  , ("srmenu", srchAct )
  , ("nvim", namedScratchpadAction scratchpads nPad >> restoreFocused)
  , ("ipython", namedScratchpadAction scratchpads iPad >> restoreFocused)
  , ("perl", namedScratchpadAction scratchpads pPad >> restoreFocused)
  , ("ranger", namedScratchpadAction scratchpads rPad >> restoreFocused)
  , ("htop", namedScratchpadAction scratchpads hPad >> restoreFocused)
  , ("clipmenu", clipcmd)
  , ("myterm", spawn $ myTerminal ++ " -name urxvt -n urxvt"  )
  , ("allpads", corePadsM_ )
  , ("byobu", byobucmd )
  , ("pomodoro", spawn "start-pomodoro")
  , ("bringbyo", withTaggedGlobalP "myterm" shiftHere >> focusUpTaggedGlobal "myterm" >> restoreFocused)
  , ("sendbyo", withTaggedP "myterm" (W.shiftWin "NSP"))
  , ("nextempty", mvNEmpty)
  , ("suicide", withFocused hideWindow)
  , ("revive", withAll showWindow)
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
nRun = urtRun nPad "nvim -u $ZDOTD/nvim/init.vim ~/buffer"
rRun = urtRun rPad "ranger"
urtRun ex cmd = concat [myTerminal, " -name ", init ex," -n ", init ex, " -e ", cmd]
prepl = urtRun pPad "reply"
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

kKPplus=0xffab :: KeySym
kKPdot=0xff9f :: KeySym
kKPzero=0xff9e :: KeySym
kKPminus=0xffad :: KeySym
raisevol=0x1008ff13 :: KeySym
lowvol=0x1008ff11 :: KeySym
kKPmute=0x1008ff12 :: KeySym
kKPenter=0xff8d :: KeySym

-- Avoid changing master on new window creation
-- avoidMaster :: W.StackSet i l a s sd -> W.StackSet i l a s sd
-- avoidMaster = W.modify' $ \c -> case c of
--   W.Stack t [] (r:rs) -> W.Stack t [r] rs
--   _ -> c

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
