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





---------------------------- 测试1 ----------------------------
testCase1 = surface (Circle (Point 1 2) 3)
testCase1' = surface (Rectangle (Point 1 2) (Point 2 3))

---------------------------- 测试2 ----------------------------
testCase2 = nudge (Circle (Point 1 2) 3) 1 2
testCase2' = nudge (Rectangle (Point 1 1) (Point 2 2)) 1 2

---------------------------- 测试3 ----------------------------
person1 = Person {firstName="Q", lastName="xq", age=18, height=1.7, phoneNumber="120", flavor="No"}
