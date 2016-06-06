import Data.Map(fromList)
import System.IO(hPutStrLn)
import XMonad
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
import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig(additionalKeysP, additionalKeys)
import qualified XMonad.Util.Loggers as L
import XMonad.Util.NamedScratchpad
import XMonad.Util.Run(spawnPipe)

-- Simple configuration
myBorderWidth = 2 :: Dimension
myBrowser = "qutebrowser" :: String
myTerminal = "st" :: String
myModMask = mod3Mask :: KeyMask
myWorkspaces = map (\w -> "<"++w++">") ["web", "de", "V", "v", "t", "com", "music", "vm"] :: [String]
myStatusBar = "dzen2 -x '0' -y '0' -h '18' -w '1920' -ta 'l' -bg '" ++ myDBGColor ++ "' -fn '" ++ myFont ++ "' -p" :: String
myFont = "-*-liberation serif-bold-r-*-*-16-120-75-75-*-*-iso8859-*" :: String
dmRun = "dmenu_run -w 300 -x 1600 -b -l 55 -fn '*-*-terminus-medium-*-*-*-16-*-*-*-*-*-*-*' "::String

limeGreen = "#a3d930" :: String
ltBlue = "#1793d1" :: String
cBlack = "#000000" :: String
cDkGray = "#1a1a1a" :: String
cOrange = "#ffbf00" :: String
cBlue = "#0066ff" :: String
cBlue2 = "#3399ff" :: String
cDkPurp = "#330033" :: String
cGreen = "#009900" :: String

myDFGColor = cOrange :: String
myDBGColor = cDkPurp :: String

myWFGColor = cGreen :: String
myWBGColor = myDBGColor :: String

myLFGColor = cBlue2 :: String
myLBGColor = myDBGColor :: String

myFFGColor = myDBGColor :: String
myFBGColor = myDFGColor :: String

myVFGColor = myDBGColor :: String
myVBGColor = myDFGColor :: String

myUFGColor = myDBGColor :: String
myUBGColor = myDFGColor :: String

myIFGColor = myDBGColor :: String
myIBGColor = myDFGColor :: String

sepFGColor = cBlack :: String
mySColor   = ltBlue :: String
myBorder   = "#121212" :: String
myFBorder  = limeGreen :: String
myFontCol  = ltBlue :: String

xmConf p = def
  { manageHook         = def <+> namedScratchpadManageHook scratchpads <+> myManageHook <+> manageDocks
  , layoutHook         = mylayoutHook
  , startupHook        = return() >> startSpawn >> setWMName "LG3D"
  , terminal           = myTerminal
  , modMask            = myModMask
  , borderWidth        = myBorderWidth
  , focusFollowsMouse  = True
  , normalBorderColor  = myBorder
  , focusedBorderColor = myFBorder
  , workspaces         = myWorkspaces
  , logHook            = myLogHook p
  , handleEventHook = docksEventHook <+> minimizeEventHook<+> handleTimerEvent
  , keys = \c -> fromList xkM
  }

main :: IO()
main = do
  dzen <- spawnPipe myStatusBar
  xmonad $ xmConf dzen
    `additionalKeysP` myKeysP

startSpawn :: X()
startSpawn = mapM_ spawn [ "st", "/usr/local/bin/maybeclipmenud.sh", "/usr/local/bin/mayberedshift.sh" ]

mylayoutHook = avoidStrutsOn [U] $ boringWindows $ minimize $ magnifiercz 1.2 $ smartBorders $
  toggleLayouts Grid (Mirror tiled )
  where
    tiled = Tall nmaster delta ratio
    nmaster = 1
    delta = 3 / 100
    ratio = 11 / 20

-- Scratchpads
scratchpads =
  [ NS "htop" "st -e htop" (title =? "htop") (customFloating $ W.RationalRect 0 0 1 (5/12))
  , NS "python" "st -e python" (title =? "python") (customFloating $ W.RationalRect 0 0 1 (5/12))
  ]
-- Manage hook
myManageHook = composeAll
  [  className =? "Xmessage"  --> doFloat
  ,className =? "Dialogue"  --> doFloat
  ]
  <+> (fmap not isDialog --> doF avoidMaster)
  <+> composeOne [ isFullscreen -?> doFullFloat ]

-- Log Hook
myLogHook p = updatePointer (0.5,0.5) (0.5,0.5) >> dynamicLogWithPP ( myDzenPP p )

-- Pretty Printing
myDzenPP p = defaultPP
  { ppCurrent         = dzenColor myFFGColor myFBGColor
  , ppVisible         = dzenColor myVFGColor myVBGColor
  , ppHidden          = dzenColor myDFGColor myDBGColor
  , ppHiddenNoWindows = dzenColor myDFGColor myDBGColor
  , ppUrgent          = dzenColor myUFGColor myUBGColor
  , ppTitle           = dzenColor myWFGColor myWBGColor . trim . shorten 100
  , ppLayout          = dzenColor myLFGColor myLBGColor
  , ppSep             = dzenColor sepFGColor myDBGColor "  - || -  "
  , ppExtras = [L.date "%a %b %d", L.loadAvg, L.battery]
  , ppOutput          = hPutStrLn p }

xkM =
  [ ((0, xK_Menu), flashText def 2 "run" >> spawn dmRun)
  , ((myModMask, xK_Menu),  flashText def 2 "search engine" >> spawn "search.sh")
  , ((myModMask, xK_g), launchApp def "evince" )
  ] ++
  [((myModMask, k), focusNth i)
    | (i, k) <- zip [0 .. 8] [xK_1 ..]]

-- Key Bindings
myKeysP =
  [ ("M-b",	spawnHere myBrowser)
  , ("M-t",  spawn myTerminal)
  , ("M4-t",  spawn myTerminal )
  , ("<Insert>", spawn "xdotool click 2")
  , ("<Print>", flashText def 2 "run" >> spawn dmRun)
  , ("S-<Print>", flashText def 2 "search engine" >> spawn "search.sh")
  , ("M-<Space>", moveTo Next EmptyWS >> spawn dmRun)
  , ("M-l", moveTo Next NonEmptyWS)
  , ("M-h", moveTo Prev NonEmptyWS)
  , ("S-M-l", shiftTo Next EmptyWS)
  , ("S-M-h", shiftTo Prev EmptyWS)
  , ("M-<Tab>", toggleWS' ["NSP"])
  , ("M-p",  submap . fromList $
    [ ((0, xK_h),    namedScratchpadAction scratchpads "htop")
    , ((0, xK_p),    namedScratchpadAction scratchpads "python")
    ])
  , ("M-<Down>", withFocused minimizeWindow)
  , ("M-S-<Down>", withFocused (\w -> withAll minimizeWindow >> sendMessage (RestoreMinimizedWin w)))
  , ("M-<Up>", sendMessage RestoreNextMinimizedWin)
  , ("M-n",     sendMessage ToggleLayout)
  , ("M-q",       spawn myRestart)
  ]

-- Helper functions
-- Avoid changing master on new window creation
avoidMaster :: W.StackSet i l a s sd -> W.StackSet i l a s sd
avoidMaster = W.modify' $ \c -> case c of
  W.Stack t [] (r:rs) -> W.Stack t [r] rs
  _ -> c

-- Kill zombie dzens before normal xmonad restart
myRestart = "killall dzen2; xmonad --recompile && xmonad --restart" :: String
