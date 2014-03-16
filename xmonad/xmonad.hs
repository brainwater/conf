import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do
  xmproc <- spawnPipe "xmobar"
  spawn "bash ${HOME}/.xmonad/autostart.bash"
  xmonad $ defaultConfig
     { manageHook = manageDocks <+> manageHook defaultConfig
     , layoutHook = avoidStruts $ smartBorders $  layoutHook defaultConfig
     , logHook = dynamicLogWithPP xmobarPP
                 { ppOutput = hPutStrLn xmproc
                 , ppTitle = xmobarColor "green" "" . shorten 50
                 }
     , modMask = mod4Mask     -- Rebind Mod (default Alt) to Windows key
     } `additionalKeys`
     [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")
     ]
