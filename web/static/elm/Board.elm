module Board where

import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import List
import Window

import Dot exposing (ID, Dot, RGBA)

-- Model

type alias Model = {
  dots : List Dot
}

initialModel = Model []

-- -- Update

-- type Action = Add Dot | Move (ID, (Float, Float)) | Remove ID

-- update : Action -> Model -> Model
-- update action model =
--   case action of
--     Add dot ->
--       { model | dots <- model.dots ++ [dot] }

--     Remove id ->
--       { model | dots <- List.filter (\dot -> dot.id /= id) model.dots }

--     Move (id, (x, y)) ->
--       { model | dots <- List.map (\dot -> if dot.id == id then { dot | x <- x, y <- y } else dot) model.dots }

-- -- View

-- view : (Int, Int) -> Model -> Element
-- view (w, h) model =
--   List.map renderDot model.dots
--   |> collage w h

-- renderDot : Dot -> Form
-- renderDot dot =
--   let c = dot.color
--   in circle dot.radius
--      |> filled (rgba c.red c.green c.blue c.alpha)
--      |> move (dot.x, dot.y)

-- -- Signal

-- dotSignal : Signal Action
-- dotSignal =
--   Signal.merge (Signal.map Add newDots) (Signal.map Move moveDots)

-- -- Port

-- port newDots : Signal Dot

-- port moveDots : Signal (ID, (Float, Float))

-- -- Main

-- -- Should use Signal.merge here
-- main = Signal.map2 view Window.dimensions <| Signal.foldp update initialModel dotSignal
