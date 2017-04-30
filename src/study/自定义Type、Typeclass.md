### 构造新的Type
使用*data*关键字
```
data MyType = Record {} | Algebraic
eg：data Point = Point Float Float deriving Show
    data Shape = Circle Point Float | Rectangle Point Point
```
> "="号右边为值构造子，它明确了该类型可能的值；值构造子的每一项可为基础*Type*或其他自定义*Type*(可理解为构造函数的参数)；**值构造子的本质是个函数，可以返回一个类型的值，True、False**  

### 类型参数
类型构造子取类型做参数，产生新的类型
```
data Maybe a = Nothing | Just a
a就是类型参数，可参考c++模板类型参数；
Maybe就是类型构造子，list也是
Nothing、[]都是多态的，可以与一切类型打交道
eg：Maybe Int、[Int];Maybe Char、[Char]...都是具体类型
```
通常我们都是都是在一个类型中包含的类型并不影响它的行为时才引入类型参数。一组什么东西组成的 List 就是一个 List，它不关心里面东西的型别是啥，然而总是工作良好。若取一组数字的和，我们可以在后面的函数体中明确是一组数字的 List。Maybe 与之相似，它表示可以有什么东西可以没有，而不必关心这东西是啥。
> tip：永远不要在 data 声明中加型别约束 =>，免得在函数声明中写出过多无谓的型别约束(data (Ord k) => Map k v = ...)

### 派生
类型类(接口)：可参见*类型.md*中基本的Typeclass  
>关键字**deriving**

### 别名
type MyType = Original  
引入型别别名的动机既非单纯表示我们函数中的既有型别，也不是为了替换掉那些重复率高的长名字体别(如 [(String,String)])，而是为了让型别对事物的描述更加明确。
```
type Name = String
```

### 递归定义
定义一个类型，其中他的构造子的 field 的类型是他自己，这样我们可以递归地定义下去。
#### fixity
infixl n *

### typeclass
```
class MyClass where
    myFunction :: String

instance Show String where
    function = 

eg：
class Eq a where
    (==) :: a -> a -> Bool
    (/=) :: a -> a -> Bool
    x == y = not (x /= y)
    x /= y = not (x == y)
从声明来看，a必须是具体类型，因为所有在函数中的类型都必须是具体类型，so：
instance (Eq m) => Eq (Maybe m) where
    Just x == Just y = x == y
    Nothing == Nothing = True
    _ == _ = False
```
也可以把 typeclass 定义成其他 typeclass 的 subclass
```
class (Eq a) => Num a where
   ...
```

### Functor typeclass
代表可以被 map over 的事物
```
*Main> :info Functor
class Functor (f :: * -> *) where
  fmap :: (a -> b) -> f a -> f b
  (<$) :: a -> f b -> f a
  {-# MINIMAL fmap #-}
        -- Defined in ‘GHC.Base’

f :: * -> *：表示f是一个接收一个类型参数的类型构造子，如Maybe、List等
*Main> :k List
List :: * -> *
*Main> :k Maybe
Maybe :: * -> *

所以实例化一个Functor时，
instance Functor [] where
    fmap = map
instance Functor Maybe where
    fmap f (Just x) = Just (f x)
    fmap f Nothing = Nothing
而不是如实例化一个Eq，
instance (Eq m) => Eq (Maybe m) where
    ...
```

### kind
我们对一个型别使用 :k 来得到他的 kind。就像我们对值(3,"abc",函数)使用 :t 来得到的他的型别一样。就像我们先前说的，型别是值的标签，而 kind 是型别的标签。
