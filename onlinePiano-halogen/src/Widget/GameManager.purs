module Widget.GameManager where

-- import Prelude ((#), (&&), (*), (+), (-), (/), (/=), (<), (<>), (==), (>))
-- import Hyper as Hyper

-- -- MODEL

-- data Direction = Left | Right

-- data Model = Model { x   :: Number , y   :: Number , vx  :: Number , vy  :: Number , dir :: Direction }

-- data Keys = Keys { x :: Number , y :: Number }

-- -- UPDATE
-- step :: Number -> Keys -> Model -> Model
-- step dt keys mario = 
-- 		mario
-- 			# gravity dt 
-- 			# jump keys  
-- 			# walk keys 
-- 			# physics dt   

-- gravity :: Number -> Model -> Model
-- gravity dt mario =
-- 		{ x : mario.x
-- 	    , y : mario.y 
-- 	    , vx : mario.vx
-- 	    , vy : if mario.y > 0.0 then mario.vy - dt/4.0 else 0.0 
-- 	    , dir : mario.dir
-- 	    }

-- jump :: Keys -> Model -> Model
-- jump keys mario =
--     if keys.y > 0 && mario.vy == 0.0 
--     	then 
--     		{ 
--     			x : mario.x,
--     			y : mario.y ,
--     			vx : mario.vx,
--     			vy : 6.0 ,
--     			dir : mario.dir
-- 		    }
--     	else mario

-- walk :: Keys -> Model -> Model
-- walk keys mario = 
-- 		{ 
-- 			x : mario.x,
-- 			y : mario.y,
-- 			vx : mario.v,
-- 			vy : mario.vy,
-- 			dir : if keys.x < 0 then Left else if keys.x > 0 then Right else mario.dir 
-- 	    }    

-- physics :: Number -> Model -> Model
-- physics dt mario =
-- 		{ x : mario.x + dt * mario.vx
-- 	    , y : if ( mario.y + dt * mario.vy < 0.0 ) then 0.0 else ( mario.y + dt * mario.vy)
-- 	    , vx : mario.vx
-- 	    , vy : mario.vy 
-- 	    , dir : mario.dir
-- 	    }


-- -- DISPLAY
-- -- Return Updated View
-- display w h mario = do
-- 	let verb = if mario.y > 0.0 then "jump" else if mario.vx /= 0.0 then "walk" else "stand"
-- 	let dir = case mario.dir of
-- 					Left -> "left"
-- 					Right -> "right"
-- 	let src  = "/mario/" <> verb <> "/" <> dir <> ".gif"
-- 	let groundY = 62 - h/2
  	
--   	let _cubeOrig = { cX : 150 , cY : 390 }     
--   	let propList = [
-- 	    Hyper.getProp "x" mario.x,
-- 	    Hyper.getProp "y" ( mario.y + groundY )
-- 	  ]
--   	Hyper.modifyGameObject (Hyper.Tag "Mario") (Hyper.PropertyList propList ) 
-- 	-- _ <- HyperCanvas.reDrawGameObject "Environment" { (rgb 174 238 238)}
-- 	-- _ <- HyperCanvas.reDrawGameObject "Ground" { (rgb 74 167 43) }  MOVE 0 ( 24 - h/2 )
