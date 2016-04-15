Shinjuku.hs
===========

Shinjuku.hsで使用するリポジトリ

* もくもく会でしたこと
* 感想
* コード
* コメント
* 質問と解答
* 要望

などなどをこのリポジトリに集約する。
参加者全員をコラボレータとして登録することで広場のように使えるかと
考えている。

うまくいくかどうか、やってみよう。

メモ
----

### コラボレータについて

コラボレータとして登録できる人数に制限はないか?
コラボレータとするよりもプルリクのほうが適切か?

### ディレクトリ構造について

メンバーそれぞれのディレクトリを作成し
そのしたにイベントのディレクトリをつくるか、
あるいはイベントのディレクトリを作成し
そのしたにメンバーのディレクトリをつくるか。

メンバーのディレクトリを上にするとそれぞれのメンバーの時系列が追いやすい。
イベントのディレクトリを上にするとイベントの感じがつかみやすい。
またあまり頻繁に参加しないメンバーもいることを考えると後者のほうが
いいかもしれない。

gitはシンボリックリンクもあつかえるようだ。
両方の長所をとることはできるだろうか。

* events
	+ event\_004
		- John
			* some.hs
			* kansou.md
		- Thomas
			* other.hs
			* question.md
	+ event\_005
		- John
			* cool.hs
			* request.md
* members
	+ Jhon
		- event_004 -> ../events/event_004/Jhon
		- event_005 -> ../events/event_005/Jhon
	+ Thomas
		- event_004 -> ../events/event_004/Thomas

シンボリックリンクを自動で生成するツールを作成しようかな。

#### 自動リンク生成ツールの仕様

* eventsディレクトリ下の名前がevent\_からはじまるディレクトリについて
	+ ディレクトリd以下の
		- 人名(大文字ではじまる)ディレクトリmについて
			* members以下になければディレクトリmを作成
			* m以下にシンボリックリンクdがなければ作成

といった感じだろうか。
メンバー用のディレクトリは必ず大文字はじまりにする。
そうすることで特殊用途のディレクトリとの名前かぶりが避けられるだろう。
シンボリックリンクはSystem.Posix.Files.createSymbolicLinkがつかえるだろう。

events以下でリンクを生成ずみのディレクトリをマークするためのファイルが必要だ。
そうしないとevent\_XXXがふえたときに処理が効率が低下するだろう。

	events/linked

に1行1ディレクトリで記録すればいいだろう。

	event_004
	event_005
	event_006

のような感じだ。

もうひとつ。
名前かぶりの問題がある。
これはDoorkeeprでつかわれているIDとの対応表を用意すれば解決するだろう。
あるいはgithubのユーザ名をつかえば解決か。

あとでコード書く。
