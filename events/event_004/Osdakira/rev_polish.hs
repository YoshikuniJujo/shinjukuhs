-- 逆ポーランド記法電卓
-- 数値はさきにはいったものがスタックの下にあることに注意する。
import Text.Read

operators :: [(String, Integer -> Integer -> Integer)]
operators = [("+", (+)), ("-", (-)), ("*", (*)), ("/", div)]

rpolishIter :: Maybe [Integer] -> [String] -> Maybe [Integer]
rpolishIter mns [] = mns
rpolishIter (Just ns) (s : ss) = case lookup s operators of
  Just o -> case ns of
    y : x : ns' -> rpolishIter (Just $ x `o` y : ns') ss -- ここで (x,y) が逆転
    _ -> Nothing
  _ -> rpolishIter (maybe Nothing (Just . (: ns)) $ readMaybe s) ss
rpolishIter _ _ = Nothing

--  ["1", "5", "+", "2", "3", "+", "*"]
-- (Just 1), "5", ["+", "2", "3", "+", "*"]
-- ([Just 5, Just 1]), ["+", "2", "3", "+", "*"]
-- ([Just 5, Just 1]), "+", ["2", "3", "+", "*"]
-- (Just 5, Just 1, []), "+", ["2", "3", "+", "*"]
-- (Just (5 + 1) : []), ["2", "3", "+", "*"]
-- (Just [6]), "2", ["3", "+", "*"]
-- (Just 2, Just [6]), ["3", "+", "*"]
-- (Just 3, Just 2, Just [6]), ["+", "*"]
-- (Just (3 + 2), Just [6]), ["*"]
-- (Just (5), Just [6]), ["*"]
-- (Just 5, Just [6]), ["*"]
-- (Just 5 * 6)

rpolish :: [String] -> Maybe [Integer]
rpolish = rpolishIter $ Just []

example1, example2, example3, example4 :: [String]
example1 = ["3", "4", "+"]
example2 = ["1", "5", "+", "2", "3", "+", "*"]
example3 = ["1", "5", "+", "2", "3", "+", "*", "4", "/"]
example4 = ["8", "5", "+", "2", "5", "-", "*", "4", "/"]

main = do
  print $ rpolish example1
  print $ rpolish example2
  print $ rpolish example3
  print $ rpolish example4
