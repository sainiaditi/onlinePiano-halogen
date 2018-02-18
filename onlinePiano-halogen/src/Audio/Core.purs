module Audio.Core where


import Audio.Notes
import Audio.Types
import Prelude

import Control.Monad.Aff (Aff, delay, launchAff_, makeAff, Canceler)
import Control.Monad.Aff.Compat (EffFnAff(..), fromEffFnAff)
import Control.Monad.Aff.Console (logShow)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Class (liftEff)
import Data.Array (length, replicate)
import Data.Either (Either(..))
import Data.Maybe (Maybe(..))
import Data.Monoid (mempty)
import Data.Time.Duration (Milliseconds(..))
import Data.Traversable (for)
import Data.Traversable (sequence)
import Unsafe.Coerce (unsafeCoerce)

foreign import playFrequency_ :: forall eff. Frequency -> Time -> (Unit -> Eff eff Unit) -> Eff eff Unit

playFrequency :: forall eff. Frequency -> Time -> Aff eff Unit
playFrequency f t = makeAff (\callback -> do
                                            playFrequency_ f t (\u -> do
                                                                        callback (Right unit))
                                            pure mempty)

play :: forall eff. Sound -> Array (Aff _ Unit)
play sound =
            let frequencies = map freq sound.notes
                t = sound.baseTime
            in
            (flip $ map) frequencies \f -> do
                playFrequency f t
                delay (Milliseconds (t * 1000.0))


createSound :: Array Note -> Patterns -> Frequency -> Sound
createSound notes pattern freq = { pattern , notes, baseTime: 1.0 / freq }

playNotes :: forall eff. Array Note -> Time -> Array (Aff _ Unit)
playNotes notes duration = play (createSound notes (replicate (length notes) X) (1.0 / duration))
