module Main (main) where


main :: IO ()
main = do
    --a <- getLine
    --b <- getLine
    --c <- getLine
    --print [a,b,c]

    --将一串 I/O action 变成一个 I/O action
    rs <- sequence [getLine, getLine, getLine]
    print rs

-- map：[print 1, print 2, ...],即[IO (), IO (), ...]
-- a :: IO [()]
a = sequence (map print [1,2,3,4,5])