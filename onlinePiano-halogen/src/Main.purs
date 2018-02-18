module Main where

import Audio.Core
import Audio.Notes
import Audio.Patterns
import Audio.Types
import Data.String
import Data.String
import Prelude
import Types
import UI.Elements
import UI.Events
import UI.Properties

import Control.Monad.Aff (Milliseconds(..), delay, forkAff, launchAff_)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log, logShow)
import Control.Monad.Eff.Exception (stack)
import Control.Plus ((<|>))
import DOM.HTML.Event.ErrorEvent (lineNo)
import DOM.HTML.Event.EventTypes (reset)
import DOM.HTML.History (back)
import Data.Array (group)
import Data.Traversable (for, sequence)
import FRP as F
import FRP.Event as E
import Halogen.VDom.Types (graft)
import UI.Core (MEvent, AttrValue(..), Attr(..), Prop)
import UI.Util as U

foreign import click :: MEvent
foreign import change :: MEvent

-- main :: forall e. Eff (console :: CONSOLE | e) Unit
-- main = do
--    launchAff_ $  do
--     -- _ <- sequence $ play (createSound [G, F, G, F, G, G, C, G, F, G, F, G, G] [X, P, X, P, X, R] 3.33)
--
--     sequence $ playNotes [G, F, G, F, G, D, G, C, C, B, C, C, D, C, G, F] 0.3


widget state =
  linearLayout
  [ id_ "mainid"
  , height "match_parent"
  , width "match_parent"
  , orientation "vertical"
  , gravity "center"
  , padding "0,0,0,30"
  , background state.background
  , cornerRadius "0"
  -- , root "true"
  -- , style state.style_Content
  ]
  [ scrollView
      [ id_ "ScrollView"
      , height "match_parent"
      , width "match_parent"
      , margin "20,7,20,0"
      , background "#FFFFFF"
      , cornerRadius "0"
      -- , style state.style_ScrollView
      ]
      [ linearLayout
          [ id_ "id1"
          , height "match_parent"
          , width "match_parent"
          , background "#FFFFFF"
          , orientation "vertical"
          ]
          [ linearLayout
              [ id_ "ll1"
              , height "wrap_content"
              , width "match_parent"
              , background "#FFFFFF"
              ]
              [ imageView
                  [ id_ "img1"
                  , height "40"
                  , width "180"
                  , margin "0,10,0,0"
                  , onClick (Some click)
                  , imageUrl "keyBottom"
                  , background state.clickme
                  ]
              ]
          , linearLayout
              [ id_ "ll2"
              , height "wrap_content"
              , width "match_parent"
              , background "#FFFFFF"
              ]
              [ imageView
                  [ id_ "img2"
                  , height "40"
                  , width "180"
                  , margin "0,50,0,0"
                  , onClick (Some click)
                  , imageUrl "keyMid"
                  , background state.clickme
                  ]
              ]
          , linearLayout
              [ id_ "ll3"
              , height "wrap_content"
              , width "match_parent"
              , background "#FFFFFF"
              ]
              [ imageView
                  [ id_ "img3"
                  , height "40"
                  , width "180"
                  , margin "0,90,0,0"
                  , onClick (Some click)
                  , imageUrl "keyMid"
                  , background state.clickme
                  ]
              ]
          , linearLayout
              [ id_ "ll4"
              , height "wrap_content"
              , width "match_parent"
              , background "#FFFFFF"
              ]
              [ imageView
                  [ id_ "img4"
                  , height "40"
                  , width "180"
                  , margin "0,130,0,0"
                  , onClick (Some click)
                  , imageUrl "keyTop"
                  , background state.clickme
                  ]
              ]
          , linearLayout
              [ id_ "ll5"
              , height "wrap_content"
              , width "match_parent"
              , background "#FFFFFF"
              ]
              [ imageView
                  [ id_ "img5"
                  , height "40"
                  , width "180"
                  , margin "0,170,0,0"
                  , onClick (Some click)
                  , imageUrl "keyBottom"
                  , background state.clickme
                  ]
              ]
          , linearLayout
              [ id_ "ll6"
              , height "wrap_content"
              , width "match_parent"
              , background "#FFFFFF"
              ]
              [ imageView
                  [ id_ "img6"
                  , height "40"
                  , width "180"
                  , margin "0,210,0,0"
                  , onClick (Some click)
                  , imageUrl "keyMid"
                  , background state.clickme
                  ]
              ]
          , linearLayout
              [ id_ "ll7"
              , height "wrap_content"
              , width "match_parent"
              , background "#FFFFFF"
              ]
              [ imageView
                  [ id_ "img7"
                  , height "40"
                  , width "180"
                  , margin "0,250,0,0"
                  , onClick (Some click)
                  , imageUrl "keyTop"
                  , background state.clickme
                  ]
              ]
          , linearLayout
              [ id_ "ll8"
              , height "wrap_content"
              , width "match_parent"
              , background state.back
              ]
              [ imageView
                  [ id_ "img8"
                  , height "40"
                  , width "180"
                  , margin "0,290,0,0"
                  , onClick (Some click)
                  , imageUrl "keyBottom"
                  , background state.clickme
                  ]
              ]
          , linearLayout
              [ id_ "ll9"
              , height "wrap_content"
              , width "match_parent"
              , background "#FFFFFF"
              ]
              [ imageView
                  [ id_ "img9"
                  , height "40"
                  , width "180"
                  , margin "0,330,0,0"
                  , onClick (Some click)
                  , imageUrl "keyMid"
                  , background state.clickme
                  ]
              ]
          , linearLayout
              [ id_ "ll10"
              , height "wrap_content"
              , width "match_parent"
              , background "#FFFFFF"
              ]
              [ imageView
                  [ id_ "img10"
                  , height "40"
                  , width "180"
                  , margin "0,370,0,0"
                  , onClick (Some click)
                  , imageUrl "keyMid"
                  , background state.clickme
                  ]
              ]
          , linearLayout
              [ id_ "ll11"
              , height "wrap_content"
              , width "match_parent"
              , background "#FFFFFF"
              ]
              [ imageView
                  [ id_ "img11"
                  , height "40"
                  , width "180"
                  , margin "0,410,0,0"
                  , onClick (Some click)
                  , imageUrl "keyTop"
                  , background state.clickme
                  ]
              ]
          , linearLayout
              [ id_ "ll12"
              , height "wrap_content"
              , width "match_parent"
              , background "#FFFFFF"
              ]
              [ imageView
                  [ id_ "img12"
                  , height "40"
                  , width "180"
                  , margin "0,450,0,0"
                  , onClick (Some click)
                  , imageUrl "keyBottom"
                  , background state.clickme
                  ]
              ]
          , linearLayout
              [ id_ "ll13"
              , height "wrap_content"
              , width "match_parent"
              , background "#FFFFFF"
              ]
              [ imageView
                  [ id_ "img13"
                  , height state.ht
                  , width "180"
                  , margin "0,490,0,0"
                  , onClick (Some click)
                  , imageUrl "keyMid"
                  , background state.clickme
                  ]
              ]
          , linearLayout
              [ id_ "ll14"
              , height "wrap_content"
              , width "match_parent"
              , background "#FFFFFF"
              ]
              [ imageView
                  [ id_ "img14"
                  , height "40"
                  , width "180"
                  , margin "0,530,0,0"
                  , onClick (Some click)
                  , imageUrl "keyTop"
                  , background state.clickme
                  ]
              ]
          ]
      ]
  ]

main = do
  log "inside main"

  --- Init State {} empty record--
  U.initializeState
  log "inside main after "

  --- Update State ----
  state <- U.updateState "background" "yellow"

  ---- Render Widget ---
  U.render (widget state) listen
  log("heloo@@@")

  pure unit


eval1 _ = do
      log "inside eval1"
      _ <- log "back"
      launchAff_ $  do

       sequence $ playNotes [A] 0.3
      U.updateState "clickme" "#000000"

listen = do
  log "inside listen"
  sig1 <- U.signal "img1" ""
  sig2 <- U.signal "img2" ""
  sig3 <- U.signal "img3" ""
  sig4 <- U.signal "img4" ""
  sig5 <- U.signal "img5" ""
  sig6 <- U.signal "img6" ""
  sig7 <- U.signal "img7" ""
  sig8 <- U.signal "img8" ""
  sig9 <- U.signal "img9" ""
  sig10 <- U.signal "img10" ""
  sig11 <- U.signal "img11" ""
  sig12 <- U.signal "img12" ""
  sig13 <- U.signal "img13" ""
  sig14 <- U.signal "img14" ""



  let behavior1 = eval1 <$> sig1.behavior

  let events1 = (sig1.event)

  U.patch widget behavior1 events1
