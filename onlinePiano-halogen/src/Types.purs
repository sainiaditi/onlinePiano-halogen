module Types where

import Prelude


import Data.Foreign.Class (class Decode, class Encode)
import Data.Foreign.Generic (defaultOptions, genericDecode, genericEncode)
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)


data Screen = FirstScreen Int | SecondScreen Int

type Rec t = {| t }

derive instance genericFirstScreen :: Generic Screen _
instance encodeFirstScreen :: Encode Screen where
  encode = genericEncode (defaultOptions {unwrapSingleConstructors = false})
instance decodeFirstScreen :: Decode Screen where
  decode = genericDecode (defaultOptions {unwrapSingleConstructors = false})

instance showScreen :: Show Screen where
  show = genericShow


newtype Position3D a = Position3D 
	{ 	cX :: Int
		, cY :: Int
		, cZ :: Int
	}

newtype Orientation3D a = Orientation3D 
	{	angX :: Int
		, angY :: Int
		, angZ :: Int
	}

newtype Cube3D a = Cube3D 
	{ 	size :: Int 
		, cX :: Int
		, cY :: Int 
		, cZ :: Int 
		, angX :: Int 
		, angY :: Int 
		, angZ :: Int
	}

