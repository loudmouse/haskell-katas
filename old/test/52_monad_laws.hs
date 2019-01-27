import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)
import Control.Monad

{-
   Monad laws:

    1. Left Identity

       Take a value, put it in the default context with return
       and then feed to a function by using `>>=`, it's the same
       as just taking the value an applying the function to it.
       return x >>= f is the same as f x

       For the list monad, return puts something in a singleton list,
       the >>= implementation for lists goes over all the values
       in the list and applies the function to them.

    2. Right Identity

       If we have a monadic value and we use >>= to feed it to return,
       then the result is our original monadic value.
       m >>= return is no different than just m

    3. Associativity

       When we have a chain of monadic function application with
       >>=, it shouldn't matter how they're nested.
       (m >>= f) >>= g is just like doing m >>= (\x -> f x >> g)
-}

type Birds = Int
type Pole = (Birds,Birds)

-- Improved logic with checks
landLeft :: Birds -> Pole -> Maybe Pole
landLeft n (left, right)
    | abs ((left + n) - right) < 4 = Just (left + n, right)
    | otherwise                    = Nothing

landRight :: Birds -> Pole -> Maybe Pole
landRight n (left, right)
    | abs (left - (right + n)) < 4 = Just (left, right + n)
    | otherwise                    = Nothing

main :: IO()
main = hspec $ do
    describe "Monad Laws" $ do
        it "abides by the first law - left identity" $ do
            pending
            {- (return 3 >>= (___)) -}
                {- `shouldBe` ((\x -> Just (x+1000)) 3) -}
        it "holds true with lists" $ do
            pending
            {- (return "WoM" >>= ___) -}
                {- `shouldBe` ((\x -> [x,x,x]) "WoM") -}
        it "abides by the second law - right identity" $ do
            pending
            {- (___ >>= (\x -> return x)) -}
                {- `shouldBe` (Just "move on up") -}
            {- ([1,2,3,4] >>= ___) -}
                {- `shouldBe` [1,2,3,4] -}
        it "abides by the third law - associativity" $ do
            pending
            -- It lands 2 on the right, then 2 on the left and again 2 on the right
            -- ___
                {- `shouldBe` Just (2,4) -}
            {- (((return (0,0) >>= ___) >>= ___) >>= ___) -}
                {- `shouldBe` Just (2,4) -}
