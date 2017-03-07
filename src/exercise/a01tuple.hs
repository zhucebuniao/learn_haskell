-- list和tuple结合

-- fst返回一个序对(pair)的首项,snd返回尾项;不能用于三元组、四元组等
-- zip::[a] -> [b] -> [(a,b)]
zipAB = zip [2,4..10] (take 7 [3,6..])
-- 取得所有三边长度皆为整数且小于等于 10，周长为 24 的直角三角形
rangeABC = [1..10]
triangles = [(a, b, c) | a <- rangeABC, b <- rangeABC, c <- rangeABC, a + b + c == 24]