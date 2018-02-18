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
    [ textView
        [ id_ "text"
        , textSize "36" 
        , margin "0,4,0,0" 
        , width "200"
        , height "100" 
        , color "black"
        , text "Piano"
        , fontStyle "Arial"
        , gravity "center" 
        ]
    , linearLayout
      [ id_ "id1"
      , margin "0,40,0,0"
      , gravity "center"
      , height "250"
      , width "1000"
      , background "black"
      , orientation "horizontal"
      ]
      [ linearLayout
          [ id_ "ll1"
          , height "wrap_content"
          , width "40"
          , background "#FFFFFF"
          ]
          [ imageView
              [ id_ "img1"
              , height "180"
              , width "40"
              , margin "0,0,0,0"
              , onClick (Some click)
              , imageUrl "keyTop"
              , background state.clickme
              ]
          ]
      , linearLayout
          [ id_ "ll2"
          , height "wrap_content"
          , width "40"
          , background "#FFFFFF"
          ]
          [ imageView
              [ id_ "img2"
              , height "180"
              , width "40"
              , margin "0,0,0,0"
              , onClick (Some click)
              , imageUrl "keyMid"
              , background state.clickme
              ]
          ]
      , linearLayout
          [ id_ "ll3"
          , height "wrap_content"
          , width "40"
          , background "#FFFFFF"
          ]
          [ imageView
              [ id_ "img3"
              , height "180"
              , width "40"
              , margin "0,0,0,0"
              , onClick (Some click)
              , imageUrl "keyBottom"
              , background state.clickme
              ]
          ]
      , linearLayout
          [ id_ "ll4"
          , height "wrap_content"
          , width "40"
          , background "#FFFFFF"
          ]
          [ imageView
              [ id_ "img4"
              , height "180"
              , width "40"
              , margin "0,0,0,0"
              , onClick (Some click)
              , imageUrl "keyTop"
              , background state.clickme
              ]
          ]
      , linearLayout
          [ id_ "ll5"
          , height "wrap_content"
          , width "40"
          , background "#FFFFFF"
          ]
          [ imageView
              [ id_ "img5"
              , height "180"
              , width "40"
              , margin "0,0,0,0"
              , onClick (Some click)
              , imageUrl "keyMid"
              , background state.clickme
              ]
          ]
      , linearLayout
          [ id_ "ll6"
          , height "wrap_content"
          , width "40"
          , background "#FFFFFF"
          ]
          [ imageView
              [ id_ "img6"
              , height "180"
              , width "40"
              , margin "0,0,0,0"
              , onClick (Some click)
              , imageUrl "keyMid"
              , background state.clickme
              ]
          ]
      , linearLayout
          [ id_ "ll7"
          , height "wrap_content"
          , width "40"
          , background "#FFFFFF"
          ]
          [ imageView
              [ id_ "img7"
              , height "180"
              , width "40"
              , margin "0,0,0,0"
              , onClick (Some click)
              , imageUrl "keyBottom"
              , background state.clickme
              ]
          ]
      , linearLayout
          [ id_ "ll8"
          , height "wrap_content"
          , width "40"
          , background state.back
          ]
          [ imageView
              [ id_ "img8"
              , height "180"
              , width "40"
              , margin "0,0,0,0"
              , onClick (Some click)
              , imageUrl "keyTop"
              , background state.clickme
              ]
          ]
      , linearLayout
          [ id_ "ll9"
          , height "wrap_content"
          , width "40"
          , background "#FFFFFF"
          ]
          [ imageView
              [ id_ "img9"
              , height "180"
              , width "40"
              , margin "0,0,0,0"
              , onClick (Some click)
              , imageUrl "keyMid"
              , background state.clickme
              ]
          ]
      , linearLayout
          [ id_ "ll10"
          , height "wrap_content"
          , width "40"
          , background "#FFFFFF"
          ]
          [ imageView
              [ id_ "img10"
              , height "180"
              , width "40"
              , margin "0,0,0,0"
              , onClick (Some click)
              , imageUrl "keyBottom"
              , background state.clickme
              ]
          ]
      , linearLayout
          [ id_ "ll11"
          , height "wrap_content"
          , width "40"
          , background "#FFFFFF"
          ]
          [ imageView
              [ id_ "img11"
              , height "180"
              , width "40"
              , margin "0,0,0,0"
              , onClick (Some click)
              , imageUrl "keyTop"
              , background state.clickme
              ]
          ]
      , linearLayout
          [ id_ "ll12"
          , height "wrap_content"
          , width "40"
          , background "#FFFFFF"
          ]
          [ imageView
              [ id_ "img12"
              , height "180"
              , width "40"
              , margin "0,0,0,0"
              , onClick (Some click)
              , imageUrl "keyMid"
              , background state.clickme
              ]
          ]
      , linearLayout
          [ id_ "ll13"
          , height "wrap_content"
          , width "40"
          , background "#FFFFFF"
          ]
          [ imageView
              [ id_ "img13"
              , height "180"
              , width "40"
              , margin "0,0,0,0"
              , onClick (Some click)
              , imageUrl "keyMid"
              , background state.clickme
              ]
          ]
      , linearLayout
          [ id_ "ll14"
          , height "wrap_content"
          , width "40"
          , background "#FFFFFF"
          ]
          [ imageView
              [ id_ "img14"
              , height "180"
              , width "40"
              , margin "0,0,0,0"
              , onClick (Some click)
              , imageUrl "keyBottom"
              , background state.clickme
              ]
          ]
      , linearLayout
          [ id_ "ll15"
          , height "wrap_content"
          , width "40"
          , background "#FFFFFF"
          ]
          [ imageView
              [ id_ "img15"
              , height "180"
              , width "40"
              , margin "0,0,0,0"
              , onClick (Some click)
              , imageUrl "keyTop"
              , background state.clickme
              ]
          ]
      , linearLayout
          [ id_ "ll16"
          , height "wrap_content"
          , width "40"
          , background "#FFFFFF"
          ]
          [ imageView
              [ id_ "img16"
              , height "180"
              , width "40"
              , margin "0,0,0,0"
              , onClick (Some click)
              , imageUrl "keyMid"
              , background state.clickme
              ]
          ]
      , linearLayout
          [ id_ "ll17"
          , height "wrap_content"
          , width "40"
          , background "#FFFFFF"
          ]
          [ imageView
              [ id_ "img17"
              , height "180"
              , width "40"
              , margin "0,0,0,0"
              , onClick (Some click)
              , imageUrl "keyBottom"
              , background state.clickme
              ]
          ]
      , linearLayout
          [ id_ "ll18"
          , height "wrap_content"
          , width "40"
          , background "#FFFFFF"
          ]
          [ imageView
              [ id_ "img18"
              , height "180"
              , width "40"
              , margin "0,0,0,0"
              , onClick (Some click)
              , imageUrl "keyTop"
              , background state.clickme
              ]
          ]
      , linearLayout
          [ id_ "ll19"
          , height "wrap_content"
          , width "40"
          , background "#FFFFFF"
          ]
          [ imageView
              [ id_ "img19"
              , height "180"
              , width "40"
              , margin "0,0,0,0"
              , onClick (Some click)
              , imageUrl "keyMid"
              , background state.clickme
              ]
          ]
      , linearLayout
          [ id_ "ll20"
          , height "wrap_content"
          , width "40"
          , background "#FFFFFF"
          ]
          [ imageView
              [ id_ "img20"
              , height "180"
              , width "40"
              , margin "0,0,0,0"
              , onClick (Some click)
              , imageUrl "keyMid"
              , background state.clickme
              ]
          ]
      , linearLayout
          [ id_ "ll21"
          , height "wrap_content"
          , width "40"
          , background "#FFFFFF"
          ]
          [ imageView
              [ id_ "img21"
              , height "180"
              , width "40"
              , margin "0,0,0,0"
              , onClick (Some click)
              , imageUrl "keyBottom"
              , background state.clickme
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
  state <- U.updateState "background" "#D3D3D3"

  ---- Render Widget ---
  U.render (widget state) listen
  log("heloo@@@")

  pure unit


eval1 _ = do
      log "inside eval1"
      _ <- log "back"
      launchAff_ $  do

       sequence $ playNotes [C3] 0.3
      U.updateState "clickme" "#000000"

eval2 _ = do
      log "inside eval2"
      _ <- log "back"
      launchAff_ $  do
       sequence $ playNotes [D3] 0.3
      U.updateState "clickme" "#000000"

eval3 _ = do
      log "inside eval3"
      _ <- log "back"
      launchAff_ $  do
       sequence $ playNotes [E3] 0.3
      U.updateState "clickme" "#000000"

eval4 _ = do
      log "inside eval4"
      _ <- log "back"
      launchAff_ $  do
       sequence $ playNotes [F3] 0.3
      U.updateState "clickme" "#000000"

eval5 _ = do
      log "inside eval5"
      _ <- log "back"
      launchAff_ $  do
       sequence $ playNotes [G3] 0.3
      U.updateState "clickme" "#000000"

eval6 _ = do
      log "inside eval6"
      _ <- log "back"
      launchAff_ $  do
       sequence $ playNotes [A3] 0.3
      U.updateState "clickme" "#000000"

eval7 _ = do
      log "inside eval7"
      _ <- log "back"
      launchAff_ $  do
       sequence $ playNotes [B3] 0.3
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
  sig15 <- U.signal "img15" ""
  sig16 <- U.signal "img16" ""
  sig17 <- U.signal "img17" ""
  sig18 <- U.signal "img18" ""
  sig19 <- U.signal "img19" ""
  sig20 <- U.signal "img20" ""
  sig21 <- U.signal "img21" ""



  let behavior1 = eval1 <$> sig1.behavior
  let behavior2 = eval2 <$> sig2.behavior
  let behavior3 = eval3 <$> sig3.behavior
  let behavior4 = eval4 <$> sig4.behavior
  let behavior5 = eval5 <$> sig5.behavior
  let behavior6 = eval6 <$> sig6.behavior
  let behavior7 = eval7 <$> sig7.behavior
  let behavior8 = eval1 <$> sig8.behavior
  let behavior9 = eval2 <$> sig9.behavior
  let behavior10 = eval3 <$> sig10.behavior
  let behavior11 = eval4 <$> sig11.behavior
  let behavior12 = eval5 <$> sig12.behavior
  let behavior13 = eval6 <$> sig13.behavior
  let behavior14 = eval7 <$> sig14.behavior
  let behavior15 = eval1 <$> sig15.behavior
  let behavior16 = eval2 <$> sig16.behavior
  let behavior17 = eval3 <$> sig17.behavior
  let behavior18 = eval4 <$> sig18.behavior
  let behavior19 = eval5 <$> sig19.behavior
  let behavior20 = eval6 <$> sig20.behavior
  let behavior21 = eval7 <$> sig21.behavior

  let events1 = (sig1.event)
  let events2 = (sig2.event)
  let events3 = (sig3.event)
  let events4 = (sig4.event)
  let events5 = (sig5.event)
  let events6 = (sig6.event)
  let events7 = (sig7.event)
  let events8 = (sig8.event)
  let events9 = (sig9.event)
  let events10 = (sig10.event)
  let events11 = (sig11.event)
  let events12 = (sig12.event)
  let events13 = (sig13.event)
  let events14 = (sig14.event)
  let events15 = (sig15.event)
  let events16 = (sig16.event)
  let events17 = (sig17.event)
  let events18 = (sig18.event)
  let events19 = (sig19.event)
  let events20 = (sig20.event)
  let events21 = (sig21.event)

  _ <- U.patch widget behavior1 events1
  _ <- U.patch widget behavior2 events2
  _ <- U.patch widget behavior3 events3
  _ <- U.patch widget behavior4 events4
  _ <- U.patch widget behavior5 events5
  _ <- U.patch widget behavior6 events6
  _ <- U.patch widget behavior7 events7
  _ <- U.patch widget behavior8 events8
  _ <- U.patch widget behavior9 events9
  _ <- U.patch widget behavior10 events10
  _ <- U.patch widget behavior11 events11
  _ <- U.patch widget behavior12 events12
  _ <- U.patch widget behavior13 events13
  _ <- U.patch widget behavior10 events14
  _ <- U.patch widget behavior11 events15
  _ <- U.patch widget behavior12 events16
  _ <- U.patch widget behavior13 events17
  _ <- U.patch widget behavior10 events18
  _ <- U.patch widget behavior11 events19
  _ <- U.patch widget behavior12 events20
  U.patch widget behavior13 events21
