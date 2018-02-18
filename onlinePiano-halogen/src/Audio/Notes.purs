module Audio.Notes where
  
  
import Prelude
import Audio.Types

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)


freq :: Note -> Frequency
freq A = 220.000
freq B = 246.942
freq C = 261.626
freq D = 293.665
freq E = 329.628
freq F = 349.228
freq G = 391.995