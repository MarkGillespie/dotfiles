import XMonad

import qualified XMonad.StackSet as W
import qualified Data.Map        as M
import Data.Ratio ((%))

import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName

import XMonad.Layout.Circle
import XMonad.Layout.Grid
import XMonad.Layout.Maximize
import XMonad.Layout.Spiral
import XMonad.Layout.ThreeColumns
import XMonad.Layout.IM

import System.Exit


------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--
myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $

    -- launch a terminal
    [ ((modMask,               xK_Return), spawn $ XMonad.terminal conf)

    -- launch dmenu
    , ((modMask,               xK_d     ), spawn "exe=`dmenu_path | dmenu` && eval \"exec $exe\"")

    -- launch xfce4-launcher
    , ((modMask,               xK_p     ), spawn "xfce4-appfinder")

    -- launch chrome
   , ((modMask .|. shiftMask,  xK_l     ), spawn "google-chrome")

    -- launch gmrun
    , ((modMask .|. shiftMask, xK_p     ), spawn "xfrun4")

    -- close focused window 
    , ((modMask .|. shiftMask, xK_c     ), kill)

     -- Rotate through the available layout algorithms
    , ((modMask,               xK_space ), sendMessage NextLayout)

    --  Reset the layouts on the current workspace to default
    , ((modMask .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)

    -- Resize viewed windows to the correct size
    , ((modMask,               xK_n     ), refresh)

    -- Move focus to the next window
    , ((modMask,               xK_Tab   ), windows W.focusDown)

    -- Move focus to the next window
    , ((modMask,               xK_j     ), windows W.focusDown)

    -- Move focus to the previous window
    , ((modMask,               xK_k     ), windows W.focusUp  )

    -- Move focus to the master window
    , ((modMask .|. shiftMask, xK_m     ), windows W.focusMaster  )

    -- Maximize the focused window temporarily
    , ((modMask,               xK_m     ), withFocused $ sendMessage . maximizeRestore)

    -- Swap the focused window and the master window
    , ((modMask .|. shiftMask, xK_Return), windows W.swapMaster)

    -- Swap the focused window with the next window
    , ((modMask .|. shiftMask, xK_j     ), windows W.swapDown  )

    -- Swap the focused window with the previous window
    , ((modMask .|. shiftMask, xK_k     ), windows W.swapUp    )

    -- Shrink the master area
    , ((modMask,               xK_h     ), sendMessage Shrink)

    -- Expand the master area
    , ((modMask,               xK_l     ), sendMessage Expand)

    -- Push window back into tiling
    , ((modMask,               xK_t     ), withFocused $ windows . W.sink)

    -- Increment the number of windows in the master area
    , ((modMask              , xK_comma ), sendMessage (IncMasterN 1))

    -- Deincrement the number of windows in the master area
    , ((modMask              , xK_period), sendMessage (IncMasterN (-1)))

    -- toggle the status bar gap
    -- TODO, update this binding with avoidStruts , ((modMask              , xK_b     ),

    -- Quit xmonad
    , ((modMask .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))

    -- Restart xmonad
    , ((modMask              , xK_q     ), restart "xmonad" True)
    
    -- to hide/unhide the panel
    , ((modMask              , xK_b), sendMessage ToggleStruts)
    ]
    ++

    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modMask, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++

    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [((m .|. modMask, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

------------------------------------------------------------------------
-- Layouts:
 
-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.

-- default tiling algorithm partitions the screen into two panes
tiled   = Tall nmaster delta ratio

threeCol = ThreeCol nmaster delta ratio

-- The default number of windows in the master pane
nmaster = 1

-- Default proportion of screen occupied by master pane
ratio   = 1/2

-- Percent of screen to increment by when resizing panes
delta   = 2/100

myChat' l = withIM size roster l
    where
        -- Ratio of screen roster will occupy
        size = 1%5
        -- Match roster window
        roster = ClassName "google-chrome" `And` Role "browser"
myChat = myChat' $ tiled ||| spiral (4/3)

-- The available layouts.  Note that each layout is separated by |||,
-- which denotes layout choice.
--
myLayout = avoidStruts $
           tiled
           ||| Mirror tiled
           ||| Full
           ||| threeCol
           ||| spiral (4/3)
           ||| myChat
 
------------------------------------------------------------------------

main = xmonad defaultConfig
              { manageHook          = manageDocks <+> manageHook defaultConfig
              , logHook             = ewmhDesktopsLogHook
              , layoutHook          = myLayout 
              {-, layoutHook          = avoidStruts $ layoutHook defaultConfig -}
              , handleEventHook     = ewmhDesktopsEventHook
              , startupHook         = ewmhDesktopsStartup >> setWMName "LG3D"
              , borderWidth         = 1
              , terminal            = "xfce4-terminal"
              , focusedBorderColor  = "#4f9bff"
              , normalBorderColor   = "#737373"
              , keys                = myKeys
              }
