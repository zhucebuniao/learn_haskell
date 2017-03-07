module Main (main) where


main :: IO ()
main = do
    putStrLn "please input your name:"
    name <- getLine
    putStrLn ("hello, " ++ name ++ ", how are you?" )
