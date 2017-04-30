module Main (main) where


--main :: IO String
main = do
    -- return不是结束执行，而是封装为IO action
    return "hehe"
    putStrLn "hello, what's your name ?"
    name <- getLine -- <-符号把IO取到的数据绑定给左边的名称
    if null name
        then return "sd"
        else do
            putStrLn ("hey, " ++ name ++ ", ni hao.")
            print [1,2,3]
            print True
            main --重复执行

