ここに疑問など書いてください。

conflictしたときは

	% git pull

などで対応してください。

- 質問(DaichiSatio)
  - encrypt m = xxcrypt 138689 13 m から encrypt = xxcrypt 138689 13
  - なぜmを省略することができるのかがわからないです。

> 解決しました

```haskell
friend "hoge" = "foo"
friend "DaichiSaito" = "self"
friend n = n ++ " is my friend"
friend Nothing = "no my frined" ここがエラーを出す...
```

上記のコードのエラー原因がわかりません  

これは型エラーですね。
文字列の型はStringですがここで求められている型はMaybe Stringです。
String型はJustをつけることでMaybe String型となります。
Maybe値のパターンマッチのところを読んでみてください。

```haskell
friend (Just "hoge") = "foo"
friend (Just "DaichiSaito") = "self"
friend (Just n) = n ++ " is my friend"
friend Nothing = "no my frined"
```

関数の読み込みは成功したのですが、関数実行でエラーを出します...  
なんででしょうか?

Just値でくるんだ値をあたえてますか?
あるいは(Just "hoge")のように括弧をつけてますか?

> 解決しました。ありがとうございます。

- 質問(yoshixmk)
  - クーラー寒いと思う人いますか？僕ちょっと寒いかも。
