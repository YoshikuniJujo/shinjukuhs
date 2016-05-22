2016-05-22

http://skami.iocikun.jp/computer/haskell/web_lecture/for_programmer
- リストを扱う標準的な関数の定義

# ruby の reduce で書く

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

