-- Then edit your handleEventHook by adding the appropriate event hook from below

--  serverModeEventHook :: Event -> X All

--  Executes a command of the list when receiving its index via a special ClientMessageEvent (indexing starts at 1). Sending index 0 will ask xmonad to print the list of command numbers in stderr (so that you can read it in ~/.xsession-errors). Uses XMonad.Actions.
--  Commands as the default.

--  main = xmonad def { handleEventHook = }
--  xmonadctl 0 # tells xmonad to output command list
--  xmonadctl 1 # tells xmonad to switch to workspace 1
--  serverModeEventHook' :: X [(String, X ())] -> Event -> X All

--  serverModeEventHook' additionally takes an action to generate the list of commands.

--  serverModeEventHookCmd :: Event -> X All

--  Executes a command of the list when receiving its name via a special ClientMessageEvent. Uses XMonad.Actions.Commands as the default.

--  main = xmonad def { handleEventHook = }
--  xmonadctl run # Tells xmonad to generate a run prompt
--  serverModeEventHookCmd' :: X [(String, X ())] -> Event -> X All

--  Additionally takes an action to generate the list of commands

--  serverModeEventHookF :: String -> (String -> X ()) -> Event -> X All

--  Listens for an atom, then executes a callback function whenever it hears it. A trivial example that prints everything supplied to it on xmonad's standard out:

--  main = xmonad def { handleEventHook = }
--  xmonadctl -a XMONAD_PRINT "hello world"
-- import Data.Maybe
import Control.Monad
import Data.Maybe
import qualified Data.Map as M
import qualified XMonad.StackSet as W
import qualified XMonad.Util.Loggers as L
import System.Exit
import System.IO(hPutStrLn)
import XMonad
import XMonad.Actions.Commands
import XMonad.Actions.CycleWS
import XMonad.Actions.FocusNth
import XMonad.Actions.ShowText
import XMonad.Actions.SpawnOn
import XMonad.Actions.Submap
import XMonad.Actions.UpdatePointer
import XMonad.Actions.WithAll
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.Minimize
import XMonad.Hooks.ServerMode
import XMonad.Hooks.SetWMName
import XMonad.Layout.BoringWindows
import XMonad.Layout.Grid
import XMonad.Layout.Magnifier
import XMonad.Layout.Minimize
import XMonad.Layout.NoBorders
import XMonad.Layout.Reflect
import XMonad.Layout.ToggleLayouts
import XMonad.Layout.TwoPane
import XMonad.ManageHook
import XMonad.Prompt
import XMonad.Prompt.AppLauncher
import XMonad.Util.Dmenu
import XMonad.Util.EZConfig(additionalKeysP, additionalKeys)
import XMonad.Util.NamedScratchpad
import XMonad.Util.Paste
import XMonad.Util.Run(spawnPipe)

myTerminal = "st" :: String
myModMask = mod3Mask :: KeyMask

xmConf p = def
  { manageHook         = def <+> myManageHook
  , layoutHook         = mylayoutHook
  , startupHook        = return() >> mapM_ spawn [ "maybeclipmenud.sh", "mayberedshift.sh" ] >> setWMName "LG3D"
  , terminal           = myTerminal
  , modMask            = myModMask
  , borderWidth        = 2
  , focusFollowsMouse  = True
  , normalBorderColor  = cDkDkGray
  , focusedBorderColor = limeGreen
  , workspaces         = map (\w -> "<"++w++">") ["W", "d", "t", "T"]
  , logHook            = updatePointer (0.5,0.5) (0.5,0.5) >> dynamicLogWithPP ( myDzenPP p )
  , handleEventHook = docksEventHook <+> minimizeEventHook <+> handleTimerEvent <+> serverModeEventHook <+> serverModeEventHookCmd' xmC
  -- <+> serverModeEventHookF "XMONAD_PRINT" (\s->spawn$ "xmessage " ++ s)
  , keys = \c -> M.fromList xkM
  }

main :: IO()
main = do
  dzP <- spawnPipe $ "dzen2 -x 0 -y 0 -h 18 -w 1920 -ta l -bg '" ++ myDBGColor ++ "' -fn " ++ apFnbar ++ " -p"
  xmonad $ xmConf dzP
    `additionalKeysP` myKeysP

mylayoutHook = avoidStrutsOn [U] $ boringWindows $ minimize $ magnifiercz 1.2 $ smartBorders $
  toggleLayouts Grid $ Mirror $ Tall 1 delta ratio
  where
    delta = 3 / 100
    ratio = 11 / 20

-- Manage hook
myManageHook = manageDocks
  <+> composeAll
  [ className =? "Xmessage"  --> doFloat
  ,className =? "Dialogue"  --> doFloat
  ]
  <+> (fmap not isDialog --> doF avoidMaster)
  <+> composeOne [ isFullscreen -?> doFullFloat ]
  <+> namedScratchpadManageHook scratchpads
  
  -- , ((0, 122), sendKey noModMask xK_Down)
xkM=
  [ ((0, xK_Menu), launchAct)
  , ((0, raisevol), replicateM_ 5 $ sendKey noModMask xK_Down)
  , ((0, lowvol), replicateM_ 5 $ sendKey noModMask xK_Up)
  , ((myModMask, raisevol), moveTo Prev NonEmptyWS >> avoidNSP)
  , ((myModMask, lowvol), moveTo Next NonEmptyWS >> avoidNSP)
  , ((myModMask, xK_F1), dmenuchoose $ M.fromList mC)
  , ((myModMask .|. controlMask, xK_y), defaultCommands >>= runCommand)
  , ((noModMask, xK_Print), sendKey (controlMask .|. shiftMask) xK_F11 )
  , ((myModMask, xK_Menu), srchAct)
  , ((myModMask, xK_y), sendKey noModMask xK_Return >> sendKey noModMask xK_F10)
  , ((myModMask, xK_v), sendKey controlMask xK_F11 >> sendKey noModMask xK_space)
  -- ] ++
  -- [ ((myModMask, k), focusNth i)
  -- | (i, k) <- zip [0 .. 8] [xK_1 ..]
  ] ++
  [ ((noModMask, l), focusNth m)
  | (m, l) <- zip [0 .. 8] [xK_KP_End, 0xff99, 0xff9b, 0xff96, 0xff9b , 0xff98, 0xff95, 0xff97, 0xff9a ]
  ]

raisevol=0x1008ff13
lowvol=0x1008ff11

myKeysP =
  [ ("M-b", spawn myBrowser)
  -- , ("M-j", focusedMin)
  , ("<Insert>", spawn "xdotool click 2")
  , ("M4-t",  spawn myTerminal )
  , ("M-c", spawn $ "clipmenu -z -l 50 -p 'clip' -fn "++apFnmenu)
  , ("M-j", withFocused minimizeWindow)
  , ("M-h", moveTo Prev NonEmptyWS >> avoidNSP)
  , ("M-i m g", launchApp def "gimp" )
  , ("M-l", moveTo Next NonEmptyWS >> avoidNSP)
  , ("M-n",     sendMessage ToggleLayout)
  , ("M-p d f", launchApp def "evince" )
  , ("M-p h",  namedScratchpadAction scratchpads "htop")
  , ("M-p p",  namedScratchpadAction scratchpads "python")
  , ("M-q",       spawn "killall dzen2; xmonad --recompile && xmonad --restart" )
  , ("M-r",       refresh)
  , ("M-<Down>", withFocused $ \w -> withAll minimizeWindow >> sendMessage (RestoreMinimizedWin w))
  , ("M-<Space>", moveTo Next EmptyWS >> avoidNSP >> spawn dmRun)
  , ("M-<Tab>", toggleWS' ["NSP"])
  , ("M-t",  spawn myTerminal)
  , ("M-k", sendMessage RestoreNextMinimizedWin)
  , ("M-<Left>", shiftTo Prev EmptyWS)
  , ("M-<Right>", shiftTo Next EmptyWS)
  ] where myBrowser = "qutebrowser"

mC =
  [ ("minone", withFocused minimizeWindow )
  , ("rest",  sendMessage RestoreNextMinimizedWin )
  ]
xmC = return mC
dmenuchoose m = dmenuMap m >>= fromMaybe (return ())
scratchpads =
  [ NS "htop" "st -e htop" (title =? "htop") nonFloating
  , NS "python" "st -e ptipython" (title =? "IPython REPL (ptipython)") nonFloating
  ]

myDzenPP p = def
  { ppCurrent         = dzenColor myFFGColor myFBGColor
  , ppVisible         = dzenColor myVFGColor myVBGColor
  , ppHidden          = dzenColor myHFGColor myHBGColor . \w -> if w /= "NSP" then w else ""
  , ppHiddenNoWindows = dzenColor myHNFGColor myHNBGColor
  , ppUrgent          = dzenColor myUFGColor myUBGColor
  , ppTitle           = dzenColor myTFGColor myTBGColor . trim . shorten 100
  , ppLayout          = dzenColor myLFGColor myLBGColor
  , ppSep             = dzenColor sepFGColor sepBGColor " -||- "
  , ppExtras = [L.date "%a %b %d", L.loadAvg, L.battery, L.logCmd "diskspace.sh"]
  , ppOutput          = hPutStrLn p }

launchAct = flashText def 4 "launch app" >> spawn dmRun :: X()
avoidNSP = replicateM_ 2 ( toggleWS' ["NSP"] ) :: X()
srchAct = flashText def 4 "search engine" >> spawn dmSrch :: X()
dmRun = "dmenu_run -w 300 -y 20 -z -p 'launch' -l 60 -fn "++apFnmenu++" "::String
dmSrch = "search.sh -w 600 -y 20 -z -p 'search' -l 60 -fn "++apFnmenu++" "::String
apFn pt = "'-*-anonymous pro-medium-r-*-*-"++pt++"-*-*-*-*-*-*-*'" :: String
apFnmenu = apFn "16"
apFnbar = apFn "17"

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
cDkOrange = "#997300" :: String

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
