import Data.List
import Text.Read

operators :: [(String, Integer -> Integer -> Integer)]
operators = [("+", (+)), ("-", (-)), ("*", (*)), ("/", div)]

rpolish1 :: Maybe [Integer] -> String -> Maybe [Integer]
rpolish1 (Just ns) s = case lookup s operators of
  Just o -> case ns of
    y : x : ns' -> Just $ x `o` y : ns'
    _ -> Nothing
  _ -> maybe Nothing (Just . (: ns)) $ readMaybe s
rpolish1 _ _ = Nothing

rpolish :: [String] -> Maybe [Integer]
rpolish = foldl' rpolish1 $ Just []

-- Bool値と整数のタプルのリストをとってしたのルールで計算する関数を作成せよ
-- 左結合
-- 一番左の値つまり初期値は0
-- Bool値がTrueならかけ算としFalseなら足し算とする
-- [(False, 3), (True, 8), (False, 7)]ならば((0 + 3) * 8) + 7で31となる
-- 1を生の再帰で解答したなら関数foldl'を使って、関数foldl'で解答したなら生の再帰を使って書き直せ

-- operators2 :: [(Bool, Integer -> Integer -> Integer)]
operators2 = [(False, (+)), (True, (*))]

-- f1 :: Maybe [Integer] -> Maybe [Integer] -> Maybe [Integer]
f1 mns [] = mns
f1 x ((t1, t2): ss) = case lookup t1 operators2 of
  Just o -> f1 (x `o` t2) ss
  _ -> Nothing
f1 _ _ = Nothing

-- f :: [(Bool, Integer)] -> Maybe [Integer]
-- f = f1 0

main = do
  print $ f1 0 [(False, 3), (True, 8), (False, 7)]
