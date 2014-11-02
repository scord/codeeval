import System.Environment (getArgs)
import Data.List

primes n = sieve [2..n]  where
   sieve []     = []
   sieve (p:xs) = p : sieve (xs \\ [p, p+p..n])

isPal x = x == reverse x

main = let isPal x = x == reverse x
       in putStrLn $ show $ maximum [ x | x <- primes 1000, isPal $ show x ]
