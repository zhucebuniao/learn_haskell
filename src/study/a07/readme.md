#### 编译运行
```
module Main (main) where
main :: IO Something
main = return Something
return把Something封装为IO action

ghc --make filename.hs
./filename
``` 
