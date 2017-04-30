import qualified Data.Map as Map  --须放在开头

data Point = Point Float Float deriving (Show)
-- Circle :: Point -> Float -> Shape
data Shape = Circle Point Float | Rectangle Point Point deriving (Show)

-- 值构造子与普通函数一样
------------------------ 1、计算面积 ------------------------
surface :: Shape -> Float
surface (Circle _ r) = pi * r^2
surface (Rectangle (Point x1 y1) (Point x2 y2)) = (abs $ x1 - x2) * (abs $ y1 - y2)

------------------------ 2、移动图形(nudge:推动) ------------------------
nudge :: Shape -> Float -> Float -> Shape
nudge (Circle (Point x y) r) a b = Circle (Point (x+a) (y+b)) r
nudge (Rectangle (Point x1 y1) (Point x2 y2)) a b = Rectangle (Point (x1+a) (y1+b)) (Point (x2+a) (y2+b)) 

-- Record Syntax：data MyType = Record {} | Algebraic
data Person = Person {
    firstName :: String,
    lastName :: String,
    age :: Int,
    height :: Float,
    phoneNumber :: String,
    flavor :: String --特点
} deriving Show

-- 类型参数
data Vector a = Vector a a a deriving (Show)
vPlus :: Num t => Vector t -> Vector t -> Vector t
(Vector a b c) `vPlus` (Vector x y z) = Vector(a+x) (b+y) (c+z)
vMult :: Num t => Vector t -> t -> Vector t
vMult (Vector a b c) x = Vector (a*x) (b*x) (c*x)
scalarMult :: Num t => Vector t -> Vector t -> t
scalarMult (Vector a b c) (Vector x y z) = a*x + b*y + c*z

-- Ethier提示更多失败的信息
data LocerState = Taken | Free deriving (Show,Eq)
type Code = String
type LockMap = Map.Map Int (LocerState, Code) -- Map k v,部分应用
lockerLookup :: Int -> LockMap -> Either String Code
lockerLookup lockerNo map = 
    case Map.lookup lockerNo map of
        Nothing -> Left $ "Locker No " ++ show lockerNo ++ " dosen't exist!"
        Just (state, code) -> if state /= Taken
            then Right code
            else Left $ "Locker " ++ show lockerNo ++ " is already taken!" 


-- 递归的定义数据结构
infixr 5 :-:
data List a = Empty | a :-: (List a) deriving (Show,Read,Eq,Ord) -- 值构造子的field又是List a自己
infixr 5 .++
(.++) :: List a -> List a -> List a
Empty .++ ys = ys
(x :-: xs) .++ ys = x :-: (xs .++ ys)

-- 树
data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show,Read,Eq)
initTree :: a -> Tree a
initTree x = Node x EmptyTree EmptyTree
--插入节点
insertTree :: Ord a => a -> Tree a  -> Tree a
insertTree x EmptyTree = initTree x
insertTree x (Node a left right)
    | x == a = Node x left right
    | x < a = Node a (insertTree x left) right
    | x > a = Node a left (insertTree x right)
--判断节点是否在树中
elemOfTree :: Ord a => a -> Tree a -> Bool
elemOfTree x EmptyTree = False
elemOfTree x (Node a left right)
    | x == a = True
    | x < a = elemOfTree x left
    | x > a = elemOfTree x right


-- typeclass define
class YesNo a where
    yesno :: a -> Bool
instance YesNo Int where
    yesno 0 = False
    yesno _ = True
instance YesNo [a] where
    yesno [] = False
    yesno _ = True
instance YesNo Bool where
    yesno = id  --id是一个函数，接受一个参数并回传相同的东西
instance YesNo (Maybe a) where 
    yesno Nothing = False
    yesno (Just _) = True
instance YesNo (Tree a) where
    yesno EmptyTree = False
    yesno _ = True

yesnoIf :: (YesNo y) => y -> a -> a -> a
yesnoIf yesnoVal yesResult noResult = 
    if yesno yesnoVal then yesResult else noResult

-- Functor
--instance Functor (Map.Map k) where
--     fmap f (Map.Map k v) = Map.Map k (f v)




---------------------------- 测试1 ----------------------------
testCase1 = surface (Circle (Point 1 2) 3)
testCase1' = surface (Rectangle (Point 1 2) (Point 2 3))

---------------------------- 测试2 ----------------------------
testCase2 = nudge (Circle (Point 1 2) 3) 1 2
testCase2' = nudge (Rectangle (Point 1 1) (Point 2 2)) 1 2

---------------------------- 测试3 ----------------------------
person1 = Person {firstName="Q", lastName="xq", age=18, height=1.7, phoneNumber="120", flavor="No"}

---------------------------- 测试4 ----------------------------
lockers :: LockMap
lockers = Map.fromList 
    [
        (100,(Taken,"ZDS2E")),
        (101,(Free,"JSKA2"))
    ]
--lockerLookup 990 lockers
--lockerLookup 100 lockers
--lockerLookup 101 lockers

---------------------------- 测试5 ----------------------------
listA = 3 :-: 4 :-: 5 :-: Empty
listA' = 1 :-: 2 :-: 3 :-: Empty
listB = 'a' :-: 'b' :-: Empty

---------------------------- 测试6 ----------------------------
--foldr :: Foldable t => (a -> b -> b) -> b -> t a -> b
treeA = foldr insertTree EmptyTree [8,3,7,1,9,6,2,5]
test10 = 10 `elemOfTree` treeA

functorMapTest :: Map.Map Int String
functorMapTest = Map.fromList
    [
        (1,"a"),
        (2,"b")
    ]
functorMapTest' = fmap (++ "!") functorMapTest