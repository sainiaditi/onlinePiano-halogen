module Audio.Types ( Sound
                   , Frequency
                   , Time
                   , Patterns
                   , Pattern (..)
                   , Note (..)
                   ) where


type Sound = { pattern :: Patterns , baseTime :: Time , notes :: Array Note }

type Frequency = Number
type Time = Number

type Patterns = Array Pattern

data Pattern = X | P | R

data Note = A | B | C | D | E | F | G
