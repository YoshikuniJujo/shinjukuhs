-- 整数の10進数表現の各桁の数を下から順に列挙したリストを返す関数を書け
--   整数を10でわった余りと10でわった結果とにわける
--   後者について再帰的にくりかえす
--   35897ならば[7,9,8,5,3]のようになる
-- 1で関数unfoldrを使ったなら生の再帰で、生の再帰を使ったなら関数unfoldrを使って書き直せ

import Data.List

f n
  | n == 0 = Nothing
  | otherwise = Just(n `mod` 10, n `div` 10)

f1 n = case f n of
  Nothing -> []
  Just (m, d) -> m : f1 d

f2 = unfoldr f

main = do
  print $ f1 35897 == [7,9,8,5,3]
  print $ f2 35897 == [7,9,8,5,3]
