-------------------------------------------
-- 型别定义行为的接口，如果某一个型别属于某Typeclass，那么他必须实现了该Typeclass所描述的行为
-- 与Java中的interface相似

-- :t (==)
-- (==) :: (Eq a) => a -> a ->Bool
-- =>符号左边的即是型别约束

   {- 
      几个基本的Typeclass:
      Eq:包含可判断相等性的型别,提供实现的函数是==和/=
      Ord:包含可比较大小的型别,提供<,>,<=,>=之类的函数;compare函数返回GT/LT/EQ三种型别的比较结果
      Show:Show的成员为可用字符串表示的型别,除函数以外的所有型别都是Show的成员;最常用的是show函数
      Read:与Show相反的Typeclass;read函数可以将字符串转换为Read的某成员型别
      Enum:Enum的成员都是连续的型别，也就是可枚举;Enum存在的主要好处就在于可以在Range中用到它的成员型别
           该Typeclass包含的型别有:(),Bool,Char,Ordering,Int,Integer,Float,Double
      Bounded:Bounded的成员型别都有一个上限和下限;提供minBounded、maxBounded函数
      Num:表示数字的Typeclass,它的成员型别都具有数字的特征;Num包含所有的数字
      Integral:仅包含整数,其成员型别有Int、Integer
      Floating:仅包含浮点型:Float、Double

      tips:fromIntegral函数
           其型别声明为:fromIntegral :: (Num b, Integral a) => a -> b.
           它取一个整数做参数并回传一个更加通用的数字，这在同时处理整数和浮点时会尤为有用
   -} 
-------------------------------------------

