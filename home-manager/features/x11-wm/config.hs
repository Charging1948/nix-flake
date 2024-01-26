import XMonad

import Xmonad.Layout.ThreeColumns

main :: IO ()
main = xmonad $ def
    { modMask = mod4Mask  -- Rebind Mod to the Super key
    }


