-- 0, 1で始まり前の値の2倍と今の値を足した値が次の値になるような数列を作れ
-- 0, 1, 1, 3, 5, 11, 21, 43, 85, 171, ...

fibs', tfibs' :: [Integer]
fibs'@(_ : tfibs') = 0 : 1 : zipWith (+) fibs' tfibs'

main = do
  print $ take 15 fibs'
