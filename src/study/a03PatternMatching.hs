fact :: Integral a => a -> a 
fact 0 = 1
fact n = n * fact (n - 1)

------------------------------------------------------
getNum :: Integral a => a -> String
getNum 1 = "one"
getNum 2 = "two"
getNum x = "bad"

getNum2 :: Integral a => a -> String
getNum2 n = case n of 1 -> "one"
                      x -> "bad"
------------------------------------------------------

newsum :: Num a => [a] -> a
newsum [] = 0
newsum (x:xs) = x + newsum xs 

newhead :: [a] -> a
newhead [] = error "it's empty!!"
newhead (x:_) = x

alls :: String -> String
alls [] = ""
alls allstr@(x:xs) = allstr

------------------------------------------------------
-- 1.
bmi :: (RealFloat) a => a -> a -> String
bmi weight height
    | bmicalc weight height <= 18.5 = "too thin"
    | bmicalc weight height <= 25.0 = "normal"
    | otherwise = "hahah"

bmicalc :: Floating a => a -> a -> a
bmicalc weight height = weight / height^2

bmicalc2 :: Floating a => [(a, a)] -> [a]
bmicalc2 xs = [bmic w h | (w, h) <- xs]
    where bmic weight height = weight / height^2

--2.
bmi2 :: RealFloat a => a -> a -> String
bmi2 weight height
    | bmi <= 18.5 = "too thin"
    | bmi <= 25.0 = "normal"
    | otherwise = "hehe"
    where bmi = weight / height^2
------------------------------------------------------

newmax :: (Ord a) => a -> a -> a
newmax a b 
    | a > b = a
    | otherwise = b

initials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."
    where (f:_) = firstname
          (l:_) = lastname
