module Dot (ID, Dot, RGBA) where

type alias ID = Int

type alias Dot = {
  id : ID,
  x : Float,
  y : Float,
  radius : Float,
  color : RGBA
}

type alias RGBA = {
  red : Int,
  green : Int,
  blue : Int,
  alpha : Float
}
