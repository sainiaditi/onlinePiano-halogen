module Audio.Notes where


import Prelude
import Audio.Types

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)


freq :: Note -> Frequency
freq A = 440.000
freq B = 493.900
freq C = 261.600
freq D = 293.700
freq E = 329.600
freq F = 349.200
freq G = 392.000
