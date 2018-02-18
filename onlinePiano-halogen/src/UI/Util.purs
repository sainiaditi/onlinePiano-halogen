module UI.Util where

import Prelude
import Types

import Control.Monad.Eff
import Control.Monad.Eff.Console

import DOM.Node.Types (Element, Document)
import FRP as F
import FRP.Behavior as B
import FRP.Event as E
import Halogen.VDom (ElemName(..), ElemSpec(..), Machine, Step(..), VDom(..), VDomMachine, VDomSpec(..), buildVDom, extract)
import Halogen.VDom.Machine (never, Machine(..), step, extract)
import UI.Core (MEvent, AttrValue(..), Attr(..), Prop)

foreign import logNode :: forall eff a . a  -> Eff eff Unit
foreign import applyAttributes ∷ forall eff. Element → Attr → Eff eff Attr
foreign import done :: forall eff. Eff eff Unit
foreign import patchAttributes ∷ forall eff. Element → Attr → Attr → Eff eff Attr
foreign import cleanupAttributes ∷ forall eff. Element → Attr → Eff eff Unit
foreign import getLatestMachine :: forall m a b eff. Eff eff (Step m a b)
foreign import storeMachine :: forall eff m a b. Step m a b -> Eff eff Unit
foreign import getRootNode :: forall eff. Eff eff Document
foreign import insertDom :: forall a b eff. a -> b -> Eff eff Unit
foreign import attachSignalEvents :: forall a b c eff.  String -> (b ->  Eff (frp::F.FRP | eff) Unit) -> Unit
foreign import initializeState :: forall eff t . Eff eff Unit
foreign import updateState :: forall eff a b t. a  -> b -> Eff eff (Rec t)
foreign import getState :: forall eff t. Eff eff (Rec t)

buildAttributes
  ∷ ∀ eff a
  . Element
  → VDomMachine eff Attr Unit
buildAttributes elem = apply
  where
  apply ∷ forall eff. VDomMachine eff Attr Unit
  apply attrs = do
    x <- applyAttributes elem attrs
    pure
      (Step unit
        (patch x)
        (done x))

  patch ∷ forall eff. Attr → VDomMachine eff Attr Unit
  patch attrs1 attrs2 = do
    x <- patchAttributes elem attrs1 attrs2
    pure
      (Step unit
        (patch x)
        (done x))

  done ∷ forall eff. Attr → Eff eff Unit
  done attrs = cleanupAttributes elem attrs

spec document =  VDomSpec {
      buildWidget: const never
    , buildAttributes: buildAttributes
    , document : document
    }

patchAndRun x myDom = do
  state <- x
  log "patching"
  machine <- getLatestMachine
  newMachine <- step machine (myDom state)
  storeMachine newMachine

render dom listen = do
  root <- getRootNode
  machine <- buildVDom (spec root) dom
  storeMachine machine
  insertDom root (extract machine)
  _ <- listen
  pure unit

signal id initialValue = do
  o <- E.create
  let behavior = B.step initialValue o.event
  let x = attachSignalEvents id  o.push 
  pure $ {behavior : behavior , event : o.event}

patch dom behavior events = do
  B.sample_ behavior events `E.subscribe` (\x -> patchAndRun x dom)
