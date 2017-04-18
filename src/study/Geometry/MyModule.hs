module MyModule (
    func1,
    func2,
    func3,
    func4
    ) where

    func1 :: Float -> Float
    func1 radius = pi * radius^2

    func2　:: Float -> Float -> Float
    func2 height radius = (func1 radius) * height

    func3 :: Float -> Float
    func3 radius = 2 * pi * radius

    func4 :: Float -> Float -> Float
    func4 height radius = (func1 radius) + (func3 radius) * height