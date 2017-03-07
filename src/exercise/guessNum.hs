doGuess num = do
    putStrLn "Enter your guess:"
    guess <- getLine
    if (read guess) < num {
        then do putStrLn "Too low!"
                doGuess num
	}
    else if (read guess) > num {
        then do putStrLn "Too high!"
                doGuess num
	}
    else do putStrLn "you win"
