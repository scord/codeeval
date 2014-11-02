import System.Environment (getArgs)
import Data.List.Split (splitOn)
import Data.Char (ord , chr)

main = do
    [inpFile] <- getArgs
    input <- readFile inpFile
    putStr $ solve input

subs :: [Int] -> [[Int]] -> Int -> [[Int]]
subs l ls n
    | length l <= n = ls ++ [l]
    | otherwise = subs (drop 1 l) (ls ++ [take n l]) n

freq l w = (w, length $ filter (==w) l)

decrypt n c m
        | ws == [] = ""
        | otherwise = [ chr (x + key) | x <- m ]
        where
            sls = subs m [] (n+2)
            ws = [ w | (w,x) <- map (freq sls) sls, x == 2 && head w == last w ]
            pattern =  head ws
            word = drop 1 $ take (n+1) pattern
            key = ord c - last word

solve input = let lns = lines input
                  tests = [ map (words) (splitOn "|" ln) | ln <- lns ]
                  outputs = [ decrypt (read n) c (map (read) m) | [[n],[[c]],m] <- tests ]
              in unlines [ ln | ln <- outputs ]
