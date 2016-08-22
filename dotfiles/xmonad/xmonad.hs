import Control.Monad(replicateM_)
import Data.Map(fromList)
import Data.Ratio((%))
import System.IO(hPutStrLn)
import XMonad
import XMonad.Actions.CycleWS
import XMonad.Actions.FocusNth (focusNth)
import XMonad.Actions.GridSelect (goToSelected)
import XMonad.Actions.TagWindows
import XMonad.Actions.UpdatePointer (updatePointer)
import XMonad.Actions.WithAll (withAll)
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops (ewmh)
import XMonad.Hooks.ManageDocks (manageDocks, docksEventHook)
import XMonad.Hooks.Minimize (minimizeEventHook)
import XMonad.Hooks.ServerMode (serverModeEventHookCmd')
import XMonad.Hooks.SetWMName (setWMName)
import XMonad.Hooks.WorkspaceHistory (workspaceHistoryHook)
import XMonad.Layout.Fullscreen (fullscreenEventHook, fullscreenManageHook, fullscreenFull)
import qualified XMonad.Layout.Gaps as G
import qualified XMonad.Layout.GridVariants as GV
import XMonad.Layout.Magnifier (magnifiercz)
import XMonad.Layout.Minimize
import XMonad.Layout.ToggleLayouts
import XMonad.Prompt.AppendFile (appendFilePrompt)
import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig(additionalKeys, additionalKeysP)
import XMonad.Util.Loggers (date, logCmd)
import XMonad.Util.NamedScratchpad
import XMonad.Util.Paste (sendKey)
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.SpawnOnce (spawnOnce)

myTerminal = "urxvt" :: String
myModMask = mod3Mask :: KeyMask
wmNameM_ = setWMName "LG3D" :: X()
uniqueInits = ["sudo updatedb", "modkey", "tilda", "maybeclipmenud", "mayberedshift"] :: [String]
xInitM_ = mapM_ spawnOnce uniqueInits :: X()
wsList =  map (\w -> "<"++w++">") ["W", "d", "t", "T"] :: [WorkspaceId]
menuH = 15 :: Int
mag = 1.3 :: Rational
mvNEmpty = moveTo Next EmptyWS :: X()
corePadsM_ = mapM_ (namedScratchpadAction scratchpads) [bPad, iPad, pPad, nPad ] :: X()
myBrowser = "fiefox" :: String
launchAct = spawn $ "j4-dmenu-desktop --display-binary --term="++myTerminal++" --dmenu='dmenu -w 600 -y "++show menuH++" -z -p launch -l 50'" :: X()
srchAct = spawn $  "srsearch -w 600 -x 200 -y "++show menuH++" -z -p 'search' -l 50" :: X()
centrPtr = updatePointer (0.5, 0.5) (0, 0) :: X()

mylayoutHook = fullscreenFull $ G.gaps [(G.U,menuH)] $ magnifiercz mag $ minimize $ toggleLayouts (GV.SplitGrid GV.T 1 2 (1%2) (16%10) delta) $ Tall 1 delta (11%20)
  where delta = 3 % 100

myManageHook = namedScratchpadManageHook scratchpads <+> manageDocks
  <+> composeAll
  [ className =? "Xmessage"  --> doFloat
  , className =? "stmenu" --> doFloat
  , className =? "Tilda" --> doFloat
  ]

xmConf p = ewmh $ def
  { manageHook         = myManageHook <+> fullscreenManageHook <+> def
  , layoutHook         = mylayoutHook
  , startupHook        = return() >> wmNameM_ >> xInitM_ >> corePadsM_
  , terminal           = myTerminal
  , modMask            = myModMask
  , borderWidth        = 0
  , focusFollowsMouse  = False
  , normalBorderColor  = cDkDkGray
  , focusedBorderColor = limeGreen
  , workspaces         = wsList
  , logHook            = dynamicLogWithPP ( myDzenPP p ) >> workspaceHistoryHook >> centrPtr
  , handleEventHook    = docksEventHook <+> minimizeEventHook <+> serverModeEventHookCmd' xmC <+> fullscreenEventHook
  , keys               = \c -> fromList xkM
  }

main :: IO()
main = do
  dzP <- spawnPipe $ "dzen2 -h "++show menuH++" -ta c -p"
  xmonad $ xmConf dzP `additionalKeysP` myKeysP

restoreFocused = withFocused $ sendMessage . RestoreMinimizedWin :: X()
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
  , ((myModMask, xK_Menu), spawn "ps -C tilda &>/dev/null || tilda")
  ] ++
  [ ((0, k), focusNth w)
    | (w, k) <- zip [0 .. 8] [xK_KP_End, 0xff99, 0xff9b, 0xff96, 0xff9d, 0xff98, 0xff95, 0xff97, 0xff9a ]
  ]

myKeysP =
  [ ("<Insert>", spawn "xdotool click 2")
  , ("M-h", moveTo Prev (WSIs $ return (('<' `elem`) . W.tag)))
  , ("M-l", moveTo Next (WSIs $ return (('<' `elem`) . W.tag)))
  , ("M-j", withFocused minimizeWindow)
  , ("M-k", sendMessage RestoreNextMinimizedWin)
  , ("M-d", kill)
  , ("M-<Left>", shiftTo Prev EmptyWS)
  , ("M-<Right>", shiftTo Next EmptyWS)
  , ("M-q",       spawn "killall dzen2; xmonad --recompile && xmonad --restart" )
  , ("M-<Tab>", toggleWS' ["NSP"])
  , ("M-t",  byobucmd )
  , ("M4-t", myTermM_ )
  ]

clipcmd = spawn "clipmenu -z -w 800 -l 50 -p 'clip'" :: X()
byobucmd = namedScratchpadAction scratchpads bPad
myTermM_ = spawn $ myTerminal ++ " -name urxvt -n urxvt" :: X()

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
  , ("myterm", myTermM_ )
  , ("allpads", corePadsM_ )
  , ("byobu", byobucmd )
  , ("pomodoro", spawn "start-pomodoro")
  , ("nextempty",(\t-> (withFocused . addTag) t >> mvNEmpty >> withTaggedGlobalP t shiftHere >> withTaggedGlobal t unTag) "shifter")
  ]
xmC = return mC

scratchpads =
  [ NS hPad hRun (title =? "htop") nonFloating
  , NS iPad pyrepl (icon =? init iPad) nonFloating
  , NS nPad nRun (icon =? init nPad) nonFloating
  , NS rPad rRun (icon =? init rPad) nonFloating
  , NS pPad prepl (icon =? init pPad) nonFloating
  , NS bPad bRun (netName =? "byobu_tmux") nonFloating
  ] where netName = stringProperty "_NET_WM_NAME"
icon = stringProperty "WM_ICON_NAME"
iPad = "ipy"
pPad = "perl"
nPad = "neovim"
rPad = "ranger"
hPad = "htop"
bPad = "byobu"
urtRun ex cmd = concat [myTerminal, " -name ", init ex," -n ", init ex, " -e ", cmd]
bRun = unwords ["urxvt",  "-name", "urxv", "-n", "urxv", "-e", "byobu-tmux", "new-session"]
hRun = urtRun hPad "htop"
nRun = urtRun nPad "nvim"
rRun = urtRun rPad "ranger"
prepl = urtRun pPad "reply"
pyrepl= urtRun iPad "ptipython"
myDzenPP p = def
  { ppCurrent         = dzenColor myFFGColor myFBGColor
  , ppVisible         = dzenColor myVFGColor myVBGColor
  , ppHidden          = dzenColor myHFGColor myHBGColor . \w -> if w /= "NSP" then w else ""
  , ppHiddenNoWindows = dzenColor myHNFGColor myHNBGColor
  , ppUrgent          = dzenColor myUFGColor myUBGColor
  , ppTitle           = dzenColor myTFGColor myTBGColor . trim . shorten 100
  , ppLayout          = dzenColor myLFGColor myLBGColor . shorten 0
  , ppSep             = dzenColor sepFGColor sepBGColor " -||- "
  , ppExtras          = [date "%a %b %d", logCmd "diskspace", logCmd "corezerot", logCmd "pymodoro-out"]
  , ppOutput          = hPutStrLn p }

kKPplus=0xffab :: KeySym
kKPdot=0xff9f :: KeySym
kKPzero=0xff9e :: KeySym
kKPminus=0xffad :: KeySym
raisevol=0x1008ff13 :: KeySym
lowvol=0x1008ff11 :: KeySym
kKPmute=0x1008ff12 :: KeySym
kKPenter=0xff8d :: KeySym

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
