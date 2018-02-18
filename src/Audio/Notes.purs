module Audio.Notes where


import Prelude
import Audio.Types

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)


freq :: Note -> Frequency
freq A3 = 220.000
freq B3 = 246.900
freq Bb3 = 233.100
freq C3 = 130.800
freq CS3 = 138.600
freq D3 = 146.800
freq E3 = 164.800
freq Eb3 = 155.600
freq F3 = 174.600
freq FS3 = 185.000
freq G3 = 196.000
freq GS3 = 207.700
freq A4 = 440.000
freq B4 = 493.900
freq Bb4 = 466.200
freq C4 = 261.600
freq CS4 = 277.2
freq D4 = 293.700
freq E4 = 329.600
freq Eb4 = 311.100
freq F4 = 349.200
freq FS4 = 370.000
freq G4 = 392.000
freq GS4 = 392.000
freq A5 = 880.000
freq B5 = 987.800
freq Bb5 = 932.300
freq C5 = 523.300
freq CS5 = 554.400
freq D5 = 587.300
freq E5 = 659.300
freq Eb5 = 622.300
freq F5 = 698.500
freq FS5 = 740.000
freq G5 = 784.000
freq GS5 = 784.000
