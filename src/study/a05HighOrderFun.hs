multThree :: Num a => a -> a -> a -> a
multThree x y z = x * y * z
multTWoWithOneArg :: Num a => a -> a -> a
multTWoWithOneArg y z = multThree 10 y z
multTWoWithTwoArgs :: Num a => a -> a
multTWoWithTwoArgs z = multTWoWithOneArg 2 z

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

-- zip :: [a] -> [b] -> [(a, b)]
newZip :: (a -> b -> c) -> [a] -> [b] -> [c]
newZip _ [] _ = []
newZip _ _ [] = []
newZip f (x:xs) (y:ys) = f x y : newZip f xs ys
-- (+) :: Num a => a -> a -> a
-- newZip :: [a] -> [a] -> [a]
newZip' = newZip (+)
-- newZip'' :: [[a]] -> [[a]] -> [[a]]
newZip'' = newZip newZip'

newFlip :: (a -> b -> c) -> b -> a -> c
-- f :: a -> b -> c
-- newFlip f :: b -> a -> c
-- f a b = c = newFlip f b a
-- 这里就利用了Curried functions的优势，只要调用newFlip f而不带y和x，它就会回传一个俩参数倒个的函数
newFlip f x y = f y x

--取一个自然数，若为偶数就除以 2；若为奇数就乘以 3 再加 1。 再用相同的方式处理所得的结果，得到一组数字构成的的链
chain :: Integral a => a -> [a]
chain 1 = [1]
chain n 
    | odd n = n:chain (n*3+1)
    | even n = n:chain (n `div` 2)

numLongChains :: Int
numLongChains = length (filter isLong (map chain [1..100]))
    where isLong xs = length xs > 15
-- lambda方式
numLongChains' :: Int
numLongChains' = length (filter (\xs -> length xs > 15) (map chain [1..100]))

funList :: Num a => [a] -> [a -> a]
funList xs = map (*) xs 
funListTest = last (funList [1..10]) 5
funListTest2 = ((funList [1..10]) !! 3) 5

-- map lambda
lamadaTest = map (\(a,b) -> a + b) [(1,2),(2,3)]

-- foldl
sum' :: Num a => [a] -> a
sum' = foldl (+) 0
sum'' :: Num a => [a] -> a
sum'' = foldl1 (+)

-- foldMap
foldMap' :: Foldable t => ([a] -> a) -> t [a] -> [a]
foldMap' f xs = foldr (\acc x -> f x : acc) [] xs
-- foldMap'' :: (a -> b) -> [a] -> [b]
foldMap'' f xs = foldl (\x acc -> acc ++ [f x]) [] xs

-- $
sumFilterMap = sum (filter (>10) (map (*2) [2..10]))
sumFilterMap' = sum $ filter (>10) $ map (*2) [2..10]

-- 函数组合
mapNegate = map (\x -> negate (abs x)) [1,2,-3,4,-6]
mapNegate' = map (negate . abs) [1,2,-3,4,-6]
