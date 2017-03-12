-------------------------------------------
-- Type 型别 首字母必须大写
-------------------------------------------

addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

-------------------------------------------
{- 
    Int 有界,与机器的位数有关;Integer 无界
    Float 单精度; Double 双精度
    Bool
    Char 
-}
-------------------------------------------

factorial :: Integer -> Integer
factorial n = product [1..n]
