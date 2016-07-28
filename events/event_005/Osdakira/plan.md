2016-05-22

http://skami.iocikun.jp/computer/haskell/web_lecture/for_programmer

リストを扱う標準的な関数の定義
- リストを扱う関数の定義について
- 関数map
- 関数filter, partition
- 関数take, drop, splitAt
- 関数takeWhile, dropWhile, span
- 関数unfoldrと関数dropWhileを使った関数filterの定義
- 関数zip, zipWith, unzip
- 関数(++), concat, reverse

# 難所

- `curry . unfoldr`: 
指定した数の要素をとりだす。

```
takeU = curry . unfoldr $ \nl -> case nl of
  (n, x : xs) | n > 0 -> Just (x, (n - 1, xs))
  _ -> Nothing
```

- 後から当たる where 

```
partitionRaw p (x : xs)
  | p x = (x : ts, es)
  | otherwise = (ts, x : es)
  where (ts, es) = partitionRaw p xs
partitionRaw _ _ = ([], [])
```

- 関数定義 + 初期化の where

```
reverseRaw = rv []
  where
  rv rs (x : xs) = rv (x : rs) xs
  rv rs _ = rs
```
↓↓↓
```
rv2 rs (x : xs) = rv2 (x : rs) xs
rv2 rs _ = rs
reverseRaw' = rv2 []
```

## ruby で書いて慣れる

```
Prelude Data.Char> foldr ((:) . (* 2)) [] [0..10]
[0,2,4,6,8,10,12,14,16,18,20]
```

```
[10] pry(main)> (0..10).reduce([]) { |xs, x| xs + [x * 2] }
=> [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20]
```

## filter with foldr

```
Prelude Data.Char> foldr (\x -> if even x then (x :) else id) [] [0..10]
[0,2,4,6,8,10]
```

```
[34] pry(main)> (0..10).reduce([]) { |xs, x| x.even? ? xs + [x] : xs }
=> [0, 2, 4, 6, 8, 10]
```

## filter

```
Prelude Data.Char> filter even [0..10]
[0,2,4,6,8,10]
```

```
[37] pry(main)> (0..10).select(&:even?)
=> [0, 2, 4, 6, 8, 10]
```

## partition

```
Prelude Data.Char Data.List> partition even [0..10]
([0,2,4,6,8,10],[1,3,5,7,9])
```

```
[44] pry(main)> (0..10).partition(&:even?)
=> [[0, 2, 4, 6, 8, 10], [1, 3, 5, 7, 9]]
```

```
Prelude Data.Char Data.List> foldr (\x (ts, es) -> if even x then (x : ts, es) else (ts, x : es)) ([], []) [0..10]
([0,2,4,6,8,10],[1,3,5,7,9])
```

```
[47] pry(main)> (0..10).reduce([[],[]]) { |(ts, es), x| x.even? ? [ts + [x], es] : [ts, es + [x]] }
=> [[0, 2, 4, 6, 8, 10], [1, 3, 5, 7, 9]]
```



