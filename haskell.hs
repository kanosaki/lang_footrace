
module Main(solve, main) where
import Data.Functor 
import qualified Data.List as List

is_prime ::  Integral b => b -> Bool
is_prime n | n < 2 = False
is_prime 2 = True
is_prime n = List.all ((/= 0).(mod n)) (takeWhile (<= upper_limit) (2:[3,5..]))
    where upper_limit = floor $ realToFrac $ sqrt $ fromIntegral n

solve ::  Integral a => a -> Int
solve 1 = 1
solve 2 = 2
solve n = length [ x | x <- [beg, beg + 2 .. 2 * n],  is_prime x ]
    where beg = if even n then n + 1 else n + 2


solve_line ::  IO ()
solve_line = do
    val <- read <$> getLine :: IO Int
    if val /= 0 then do
        putStrLn.show $ solve val
        solve_line
    else return ()
       

main ::  IO ()
main = solve_line 

