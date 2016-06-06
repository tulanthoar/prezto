import Control.Monad
import Data.List
import Data.Ratio ((%))
import qualified Data.Map        as M
import qualified XMonad.Layout.Magnifier as Mag
import qualified XMonad.Layout.ToggleLayouts as Tog
import qualified XMonad.StackSet as W
import System.IO
import System.IO.Unsafe
import XMonad
import XMonad.Actions.FocusNth
import XMonad.Actions.CycleWS
import XMonad.Actions.OnScreen
import XMonad.Actions.Search
import XMonad.Actions.ShowText
import XMonad.Actions.SpawnOn
import XMonad.Actions.Submap
import XMonad.Actions.SwapWorkspaces
import XMonad.Actions.UpdatePointer
import XMonad.Actions.WithAll
import XMonad.Hooks.Minimize
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.ICCCMFocus
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Hooks.UrgencyHook hiding (Never)
import XMonad.Layout.BoringWindows
import XMonad.Layout.Grid
import XMonad.Layout.IM
import XMonad.Layout.Minimize
import XMonad.Layout.MultiToggle
import XMonad.Layout.NoBorders
import XMonad.Layout.PerWorkspace
import XMonad.Layout.Reflect
import XMonad.Layout.Tabbed
import XMonad.Layout.TwoPane
import XMonad.ManageHook
import XMonad.Prompt
import XMonad.Prompt.AppendFile
import XMonad.Prompt.Input
import XMonad.Prompt.RunOrRaise
import XMonad.Prompt.Shell
import XMonad.Prompt.Workspace
import XMonad.Prompt.XMonad
import XMonad.Util.EZConfig(additionalKeysP, additionalKeys)
import XMonad.Util.NamedScratchpad
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.Loggers

-- Simple configuration
myBorderWidth = 2
myBrowser = "qutebrowser"
myTerminal = "st"
myShell = "zsh"
myModMask = mod3Mask
myWorkspaces = map (\w -> "<"++w++">") ["web", "de", "V", "v", "t", "com", "music", "vm"]
myIconDir = "/home/ant/.dzen/dzenIcons/"
myStatusBar = "dzen2 -x '0' -y '0' -h '18' -w '1920' -ta 'l' -bg '" ++ myDBGColor ++ "' -fn '" ++ myFont ++ "' -p"
myFont = "-*-liberation serif-bold-r-*-*-16-120-75-75-*-*-iso8859-*"

limeGreen = "#a3d930"
ltBlue = "#1793d1"
cBlack = "#000000"
cDkGray = "#1a1a1a"
cOrange = "#ffbf00"
cBlue = "#0066ff"
cBlue2 = "#3399ff"
cDkPurp = "#330033"
cGreen = "#009900"

myDFGColor = cOrange
myDBGColor = cDkPurp

myWFGColor = cGreen
myWBGColor = myDBGColor

myLFGColor = cBlue2
myLBGColor = myDBGColor

myFFGColor = myDBGColor
myFBGColor = myDFGColor

myVFGColor = myDBGColor
myVBGColor = myDFGColor

myUFGColor = myDBGColor
myUBGColor = myDFGColor

myIFGColor = myDBGColor
myIBGColor = myDFGColor

sepFGColor = cBlack
mySColor   = ltBlue
myBorder   = "#121212"
myFBorder  = limeGreen
myFontCol  = ltBlue
xmConf p = withUrgencyHook dzenUrgencyHook {args = ["-bg", "green", "-xs", "0"] } $ defaultConfig
      { manageHook         = def <+> namedScratchpadManageHook scratchpads <+> myManageHook <+> manageDocks
      , layoutHook         = mylayoutHook
      , startupHook        = return() >> startSpawn >> setWMName "LG3D"
      , terminal           = myTerminal
      , modMask            = myModMask
      , borderWidth        = myBorderWidth
      , focusFollowsMouse  = False
      , normalBorderColor  = myBorder
      , focusedBorderColor = myFBorder
      , workspaces         = myWorkspaces
      , logHook            = myLogHook >> dynamicLogWithPP ( myDzenPP p )
      , handleEventHook = def <+> docksEventHook <+> minimizeEventHook<+> handleTimerEvent
      , keys = \c -> M.fromList xkM
      }
main = do
    dzen <- spawnPipe myStatusBar
    xmonad $ xmConf dzen
      `additionalKeysP` myKeys

startSpawn = mapM_ spawn [ "st", "/usr/local/bin/maybeclipmenud.sh", "/usr/local/bin/mayberedshift.sh" ]

mylayoutHook = avoidStrutsOn [U] $ boringWindows $ minimize $ Mag.magnifiercz 1.2 $ smartBorders $
  Tog.toggleLayouts Grid (Mirror tiled )
  where
      tiled = Tall nmaster delta ratio
      nmaster = 1
      delta = 3 / 100
      ratio = 11 / 20

-- Scratchpads
scratchpads = [
    NS "htop" "st -e htop" (title =? "htop") (customFloating $ W.RationalRect 0 0 1 (5/12))
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
myLogHook = takeTopFocus >> fadeInactiveLogHook fadeAmount >> updatePointer (0.5,0.5) (0.5,0.5)
    where fadeAmount = 0.90

-- Pretty Printing
myDzenPP h = defaultPP
     {  ppCurrent         = dzenColor myFFGColor myFBGColor . wrap ("^i(" ++ myIconDir ++ "/dzen_bitmaps/has_win.xbm)") ""
      , ppVisible         = dzenColor myVFGColor myVBGColor . wrap ("^i(" ++ myIconDir ++ "/dzen_bitmaps/has_win.xbm)") ""
      , ppHidden          = dzenColor myDFGColor myDBGColor . wrap ("^i(" ++ myIconDir ++ "/dzen_bitmaps/has_win.xbm)") "" . filterNSP
      , ppHiddenNoWindows = dzenColor myDFGColor myDBGColor . wrap ("^i(" ++ myIconDir ++ "/dzen_bitmaps/has_win_nv.xbm)") ""  .filterNSP
      , ppUrgent          = dzenColor myUFGColor myUBGColor . wrap ("^i(" ++ myIconDir ++ "/info_03.xbm)") "" . dzenStrip
      , ppTitle           = dzenColor myWFGColor myWBGColor . trim . shorten 100
      , ppLayout          = dzenColor myLFGColor myLBGColor .
                            -- None of these match anymore, need to strip off Mag/Toggle/Reflect
                            (\x -> case x of
                            "Mirror Tall" -> "^fg(" ++ myIFGColor ++ ")^i(" ++ myIconDir ++ "/dzen_bitmaps/mtall.xbm)"
                            "Tall"	  -> "^fg(" ++ myIFGColor ++ ")^i(" ++ myIconDir ++ "/dzen_bitmaps/tall.xbm)"
                            "Full"	  -> "^fg(" ++ myIFGColor ++ ")^i(" ++ myIconDir ++ "/dzen_bitmaps/full.xbm)"
                            "Tabbed Simplest"	  -> "^fg(" ++ myIFGColor ++ ")^i(" ++ myIconDir ++ "/dzen_bitmaps/full.xbm)"
                            "Grid"	  -> "^fg(" ++ myIFGColor ++ ")^i(" ++ myIconDir ++ "/dzen_bitmaps/grid.xbm)"
                            "TwoPane"	  -> "^fg(" ++ myIFGColor ++ ")^i(" ++ myIconDir ++ "/dzen_bitmaps/two_pane.xbm)"
                            _ -> x
                            )
     , ppSep             = dzenColor sepFGColor myDBGColor "  - || -  "
     , ppExtras = [date "%a %b %d"]
     , ppOutput          = hPutStrLn h }
     where
        filterNSP ws = if ws /= "NSP" then ws else ""


xkM = [ ((0, xK_Menu), flashText def 2 "run" >> spawn "dmenu_run -w 300 -x 1600 -b -l 55 -fn '*-*-terminus-medium-*-*-*-16-*-*-*-*-*-*-*' ")
      , ((myModMask, xK_Menu),  flashText def 2 "search engine" >> spawn "search.sh")
      ]

-- Key Bindings
myKeys = [ ("M-b",	spawnHere myBrowser)
         -- run
         , ("M-t",  spawn myTerminal)
         , ("M4-t",  spawn myTerminal )
         , ("<Insert>", spawn "xdotool click 2")
         , ("<Print>", flashText def 2 "run" >> spawn "dmenu_run -w 300 -x 1600 -b -l 55 -fn '*-*-terminus-medium-*-*-*-16-*-*-*-*-*-*-*' ")
         , ("S-<Print>", flashText def 2 "search engine" >> spawn "search.sh")
         , ("M-<Space>", moveTo Next EmptyWS >> spawn "dmenu_run")
         , ("M-l", moveTo Next NonEmptyWS)
         , ("M-h", moveTo Prev NonEmptyWS)
         , ("S-M-l", shiftTo Next EmptyWS)
         , ("S-M-h", shiftTo Prev EmptyWS)
         , ("M-<Tab>", toggleWS' ["NSP"])
          -- scratchpads
         , ("M-p",  submap . M.fromList $
            [ ((0, xK_h),    namedScratchpadAction scratchpads "htop")
            , ((0, xK_p),    namedScratchpadAction scratchpads "python")
            ])
         -- minimize
         , ("M-<Down>", withFocused minimizeWindow)
         , ("M-S-<Down>", withFocused (\w -> withAll minimizeWindow >> sendMessage (RestoreMinimizedWin w)))
         , ("M-<Up>", sendMessage RestoreNextMinimizedWin)

         -- toggleLayouts
         , ("M-n",     sendMessage Tog.ToggleLayout)

         -- restart
         , ("M-q",       spawn myRestart)
         , ("M-<F1>", focusNth 0)
         , ("M-<F2>", focusNth 1)
         , ("M-<F3>", focusNth 2)
         , ("M-<F4>", focusNth 3)
         , ("M-<F5>", focusNth 4)
         , ("M-<F6>", focusNth 5)
         , ("M-<F7>", focusNth 6)
         ]

-- Helper functions
-- Avoid changing master on new window creation
avoidMaster :: W.StackSet i l a s sd -> W.StackSet i l a s sd
avoidMaster = W.modify' $ \c -> case c of
  W.Stack t [] (r:rs) -> W.Stack t [r] rs
  _                   -> c

-- Kill zombie dzens before normal xmonad restart
myRestart = "for pid in `pgrep dzen2`; do kill -9 $pid; done && xmonad --recompile && xmonad --restart" :: String
