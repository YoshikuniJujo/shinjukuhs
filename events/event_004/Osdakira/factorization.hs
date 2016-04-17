-- head $ filter ((== 0) . (n `mod`)) [2 ..]
-- head: 配列の先頭を取得
-- filter: 述語が真を返すとき要素をリストに追加
-- ((== 0) . (n `mod`)): n が割り切れたか bool を返す関数
-- 分解してみる

f :: Integer -> [Integer] -> [Integer]
f n (s: ss)
  | n `mod` s == 0 = s : f n ss
  | otherwise = f n ss

main = do
  print $ head $ f 10 [2 .. ]
  print $ head $ f 13 [2 .. ]

-- 合ってそう
