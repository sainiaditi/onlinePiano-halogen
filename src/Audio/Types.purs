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

data Note = A3 | B3 | Bb3 | C3 | CS3 | D3 | E3 | Eb3 | F3 | FS3 | G3 | GS3 |
            A4 | B4 | Bb4 | C4 | CS4 | D4 | E4 | Eb4 | F4 | FS4 | G4 | GS4 |
            A5 | B5 | Bb5 | C5 | CS5 | D5 | E5 | Eb5 | F5 | FS5 | G5 | GS5 
