import XMonad
import XMonad.Hooks.ManageDocks

main = xmonad defaultConfig
              { manageHook          = manageDocks <+> manageHook defaultConfig
              , layoutHook          = avoidStruts  $  layoutHook defaultConfig
	      , borderWidth         = 1
	      , terminal            = "xfce4-terminal"
              , focusedBorderColor  = "#4f9bff"
              , normalBorderColor   = "#737373"
              }
