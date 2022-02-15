import Xmonad
import Xmonad.Hooks.DynamicLog
import Xmonad.Hooks.ManageDocks
import Xmonad.Util.Run(spawnPipe)
import Xmonad.Util.EZConfig(additionalKeys)
import System.IO

main = do
    xmonad $ docks defaultConfig {
    layoutHook = avoidStrusts $ layoutHook defaultConfig
    , modMask = mod4Mask  -- Rebind Mod to the Windows key
    }
   
