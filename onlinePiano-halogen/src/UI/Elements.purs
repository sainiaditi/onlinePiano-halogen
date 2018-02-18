module UI.Elements
	( Node
	, Leaf
    , element
    , linearLayout
    , relativeLayout
    , textView
    , editText
    , scrollView
    , imageView
	) where

import Prelude

import Data.Maybe (Maybe(..))

import Halogen.VDom (ElemName(..), ElemSpec(..), VDom(..))

import UI.Core (Attr(..), Prop)

type Node p i
   = Array Prop
  -> Array (VDom p i)
  -> VDom p i

type Leaf p i
   = Array Prop
  -> VDom p i


element :: forall i. ElemName -> Array Prop -> Array (VDom Attr i) -> VDom Attr i
element elemName props children = Elem (ElemSpec Nothing elemName (Attr props)) children

node :: forall i. String -> Node Attr i
node elem = element (ElemName elem)

leaf :: forall i. String -> Leaf Attr i
leaf elem props = element (ElemName elem) props []

linearLayout :: forall i. Node Attr i
linearLayout = node "linearLayout"

relativeLayout :: forall i. Node Attr i
relativeLayout = node "relativeLayout"

horizontalScrollView :: forall i. Node Attr i
horizontalScrollView = node "horizontalScrollView"

scrollView :: forall i. Node Attr i
scrollView = node "scrollView"



imageView :: forall i. Leaf Attr i
imageView = leaf "imageView"

editText :: forall i. Leaf Attr i
editText = leaf "editText"

listView :: forall i. Leaf Attr i
listView = leaf "listView"

progressBar :: forall i. Leaf Attr i
progressBar = leaf "progressBar"

textView :: forall i. Leaf Attr i
textView = leaf "textView"

viewPager :: forall i. Leaf Attr i
viewPager = leaf "viewPager"

