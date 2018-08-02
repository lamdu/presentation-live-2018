import Control.Lens.Operators
import Prelude



fibonacci :: [Integer]
fibonacci =
    iterate step (1, 0)
    <&> fst
    where
        step (cur, prev) = (cur+prev, cur)


>>> take 10 fibonacci
[1,1,2,3,5,8,13,21,34,55]