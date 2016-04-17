-- https://skami.iocikun.jp/computer/haskell/web_lecture/for_programmer/polish_fold_right.html
-- `_ -> maybe Nothing (Just . (: ns)) $ readMaybe s` の意味が分からない

-- Haskellでは連続した($)の最後以外を(.)に置き換えられる。
-- から、`_ -> maybe Nothing (Just $ (: ns)) $ readMaybe s` になる？

-- http://blog.sarabande.jp/post/13632084465
-- lookup で見つかったら、否定で返す
-- 見つからなかったら、Nothing になるので、Default の 5 が返る
-- main = do
--   print $ maybe 5 negate (lookup 1 [(1,10),(2,20)])
--   print $ maybe 5 negate (lookup 2 [(1,10),(2,20)])
--   print $ maybe 5 negate (lookup 3 [(1,10),(2,20)])

-- よって、
-- maybe Nothing (Just $ (: ns)) $ readMaybe s`
-- (Just $ (: ns)) $ readMaybe s か、Nothing を返す
-- (Just $ (: ns)) $ readMaybe s とは？
-- https://skami.iocikun.jp/computer/haskell/web_lecture/for_programmer/polish.html
-- 関数readMaybeは文字列が数値として読めればJust値をそうでなければNothingを返す。
-- おそらく (Just ((readMaybe s) : ns))

-- 違った。
-- $ で明確に別れる、ということらしい。
-- (readMaybe s) を (Just . (: ns)) に適用する。`.` は関数結合なので、`$`に変換できない
