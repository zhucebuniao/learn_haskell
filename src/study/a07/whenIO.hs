import Control.Monad

main = do
    c <- getChar
    when (c /= ' ') $ do
        putChar c
        main
{- 
   when 将 if something then do some I/O action else return () 这样的模式封装起来
-}