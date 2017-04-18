### 构造新的Type
使用*data*关键字
```
data MyType = Record {} | Algebraic
eg：data Bool = True | False
```
> "="号右边为值构造子，它明确了该类型可能的值；值构造子的每一项可为基础*Type*或其他自定义*Type*(可理解为构造函数的参数)；**值构造子的本质是个函数，可以返回一个类型的值，True、False**  

### 类型参数
类型构造子取类型做参数，产生新的类型
```
data Maybe a = Nothing | Just a
a就是类型参数，可参考c++模板类型参数；
Maybe就是类型构造子，list也是
Nothing、[]都是多态的，可以与一切类型打交道
eg：Maybe Int、[Int];Maybe Char、[Char]...
```
通常我们都是都是在一个类型中包含的类型并不影响它的行为时才引入类型参数。一组什么东西组成的 List 就是一个 List，它不关心里面东西的型别是啥，然而总是工作良好。若取一组数字的和，我们可以在后面的函数体中明确是一组数字的 List。Maybe 与之相似，它表示可以有什么东西可以没有，而不必关心这东西是啥。
> tip：永远不要在 data 声明中加型别约束，免得在函数声明中写出过多无谓的型别约束(data (Ord k) => Map k v = ...)

###派生
类型类(接口)：可参见*类型.md*中基本的Typeclass  
>关键字**deriving**