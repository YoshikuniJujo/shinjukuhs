# 第5回Haskell勉強会
- 仕事でRailsのサービス(中身は諸事情よりお伝えできない)を作っていて、それのjavascriptをやってました
- 冷房関連に不便があり、すみませんでした
- おまけ(画像抽出も作ったけどコード量が多すぎて貼れない...)

```
javascript:(function()%7Bvar scrollPos %3D %24('body').scrollTop()%3Bvar count %3D 0%3Bvar timer %3D setInterval(function() %7Bif(count < 9) %7B%24('html%2C body').animate(%7BscrollTop%3A %24(document).height() %7D%2C 'fast')%3Bcount%2B%2B%3B%7D else %7B%24('html%2C body').animate(%7BscrollTop%3A scrollPos%7D%2C 'show')%3BclearInterval(timer)%3B%7D%7D%2C 2000)%7D)()
```
- 使い方
  - 上記のコードをブックマークにいれる
  - twitterでそのブックマークを実行する
- 読み込みを事前に行うので読み込みにイライラがなくなるメリットがある

- Haskellでやったこと
  - 日経コンピューターの記事を読んでいた
    - haskellの特徴 遅延評価
    - [モナディウス(Haskellで作られたゲーム)](http://www.geocities.jp/takascience/haskell/monadius_ja.html)
