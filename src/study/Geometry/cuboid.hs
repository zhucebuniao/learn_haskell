-- 长方体
module Geometry.Cuboid (
    volume,
    area
    ) where

    volume :: Float -> Float -> Float -> Float
    volume a b c = rectangelArea a b * c

    area :: Float -> Float -> Float -> Float
    area a b c rectangelArea a b * 2 + rectangelArea a c * 2 + rectangelArea b c * 2

    rectangelArea :: Float -> Float -> Float 
    rectangelArea a b = a * b