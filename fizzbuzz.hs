import System.Environment (getArgs)

main = do
	[inpFile] <- getArgs
	input <- readFile inpFile
	putStr $ solve input

fizzbuzz x y n = map f [1..n]
	 where f i | i `mod` x == 0 && i `mod` y == 0 = "FB"
			   | i `mod` x == 0 = "F"
			   | i `mod` y == 0 = "B"
			   | otherwise = show i

solve input = let lns = lines input
                  tests = [ map read $ words ln | ln <- lns ]
                  outputs = [ fizzbuzz x y n | [x,y,n] <- tests ]
              in unlines [ unwords ln | ln <- outputs ]
