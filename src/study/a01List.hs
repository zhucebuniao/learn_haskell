-- ++用于连接两个List
l1 = [1,2,3]
l2 = [4,5,6]
l3 = l1 ++ l2

l4 = "hello" ++ " " ++ "world"
-- :用于把单个元素加入到List中
l5 = 0:l3

-- !! 用于取List中的元素
index1 = l5 !! 1
-- head取List头部;last取List最后一个元素;tail取List尾部(除第一个元素);init取List除最后一个元素的部分
headi = head l5
lasti = last l5
tailp = tail l5
initp = init l5
-- length返回一个List的长度
lenL5 = length l5


-- List的比较 > < =
b1 = l1 < l2

-- null 判断List是否为空，避免使用L5==[]判断
isNullL5 = null l5

-- reverse翻转
l5reverse = reverse l5
-- take n List 返回List前n个元素;drop n删除前n个元素
take3 = take 3 l5
-- maximum返回最大;minimum返回最小;sum求和;product求积
maxInL5 = maximum l5
minInL5 = minimum l5
-- elem判断元素是否在List中，通常用中缀形式
isElem = 4 `elem` l5

-- range
l20 = [1..20]
l02 = [20,19..1]
az = ['a'..'z']
-- range with step
l20' = [2,4..20]
l20'' = [4,8..20]

-- cycle List 接收一个list返回一个无限list
cycle2 = take 10 (cycle ['a'..'e'])
-- repeat elem 接收一个值，返回包含该值的无限list
repeat10 = take 10 (repeat 'a')
-- replicate n elem 返回包含elem的list n次
replicate10 = replicate 10 4

-- comperehension(理解??) 
-- S = {2 * x | x 属于 N, x <= 10}
timesX10 times = [times * x | x <- [1..10]] 
mod7 = [x | x <- [50..100], x `mod` 7 == 3]
boomBangs xs = [if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x, x /= 11] -- /= 不等于
productLists = [x * y * z | x <- [2..5], y <- [3,4,7], z <- [5,9], x * y * z > 50]
length' xs = sum [1 | _ <- xs]
removeNonUppercase str = [c | c <- str, c `elem` ['A'..'Z']]

-------------------------------------------
-- 嵌套List
-------------------------------------------
nestedList xxs = [[x | x <- xs, even x] | xs <- xxs]
nestedEg = 
    [
      [1,23,4,5,6],
      [2,3,4,5,13],
      [9,23,2,4]
    ]
nestedRet = nestedList nestedEg
