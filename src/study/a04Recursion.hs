newtake :: (Num i, Ord i) => i -> [a] -> [a]
newtake n _
    | n <= 0 = []  --若n<=0回传空list;没有otherwise，表示若n>0转入下一个模式
newtake _ [] = [] 
newtake n (x:xs) = x:newtake (n-1) xs

quickSort :: Ord a => [a] -> [a]
quickSort [] = []
quickSort (x:[]) = [x]
quickSort (x:xs) = 
    let
        smaller = quickSort [a | a <- xs, a <= x]
        bigger = quickSort [a | a <- xs, a >= x]
    in
        smaller ++ [x] ++ bigger
