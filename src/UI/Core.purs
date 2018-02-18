module UI.Core
	( MEvent
	, AttrValue(..)
	, Attr(..)
	, Prop
	) where

import Prelude

import Data.Foreign (Foreign)
import Data.Tuple (Tuple)


data MEvent

{-- data AttrTypes = String | Foreign --}
data AttrValue = AttrValue String | ScreenTag Foreign | Some MEvent

newtype Attr = Attr (Array Prop)

type Prop = Tuple String AttrValue

