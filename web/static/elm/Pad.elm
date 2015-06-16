module Pad where

import Color exposing (Color, rgba)
import Graphics.Collage exposing (collage, rect, filled)
import Graphics.Element exposing (Element)
import List exposing (head)
import Signal
import Time
import Touch exposing (Touch, touches)
import Window

import Dot exposing (ID, Dot, DotMove, RGBA)

-- Model

initialDot = Dot config.id 0.0 0.0 config.radius config.color

-- Update

type Action = Add Dot | Move DotMove | Remove ID

-- View

render : (Int, Int) -> Element
render (w, h) =
  let c = config.color
  in collage w h [
      rect (w |> toFloat) (h |> toFloat)
      |> filled (rgba c.red c.green c.blue c.alpha)
    ]

-- Util

toCartesian : Int -> Int -> (Int, Int) -> (Float, Float)
toCartesian w h (x, y) =
  let dx = w |> toFloat |> (*) 0.5
      dy = h |> toFloat |> (*) 0.5
      fx = toFloat x
      fy = toFloat y
  in (fx - dx, -(fy - dy))

touchToAction : (Int, Int) -> Touch -> Action
touchToAction (w, h) touch =
  let (x, y) = toCartesian w h (touch.x, touch.y)
      (x0, y0) = toCartesian w h (touch.x0, touch.y0)
  in if | (x == x0) && (y == y0) -> Add (Dot config.id x y config.radius config.color)
        | otherwise -> Move (DotMove config.id x y)

touchesToPoint : (Int, Int) -> List Touch -> Action
touchesToPoint (w, h) touchs =
  case List.head touchs of
    Just touch -> touchToAction (w, h) touch
    Nothing -> Remove config.id

-- Signal

pointActions : Signal Action
pointActions =
  Signal.map2 (touchesToPoint) Window.dimensions touches

-- Port
port config : { id : ID, radius : Float, color : RGBA }

port addPoint : Signal Dot
port addPoint =
  let takeAdd action = case action of
                         Add dot -> Just dot
                         _ -> Nothing
  in Signal.filterMap takeAdd initialDot pointActions

port movePoint : Signal DotMove
port movePoint =
  let takeMove action = case action of
                          Move dotMove -> Just dotMove
                          _ -> Nothing
  in Signal.filterMap takeMove (DotMove config.id  0.0  0.0) pointActions

port removePoint : Signal ID
port removePoint =
  let takeRemove action = case action of
                            Remove id -> Just id
                            _ -> Nothing
  in Signal.filterMap takeRemove config.id pointActions

-- Main
main = Signal.map render Window.dimensions
