# かんたんSNS
​
## サイト概要
### サイトテーマ
​世代関係なく楽しみや知識を共有し、関係を繋ぐことができるSNS

### テーマを選んだ理由
​前職で同世代の人としか関りがない人と話す機会が多く、異世代とのかかわり方がわからなかったり、寂しさを感じている方がいて、どうにかしたいと考えていました。

 そのため、そのような方でも気軽に何かを投稿し、その投稿をきっかけに異世代とのかかわり方を知ったり、寂しさを減らして欲しいという考えからSNSを作ろうと考えました。

 そして、最近のSNSはわかりやすくも機能が多く、細かい機能を必要としていない人からすると難しく忌避感を感じる可能性があると考えたため、少ない種類で投稿の分類やUIがわかりやすいSNSを作ることで既存のSNSを使ったことの無い方たちのSNSへの苦手意識を減らしつつ、交流が活発になるかもしれないという考えからこのテーマにしました。

### ターゲットユーザ
- 異世代の人と関わってみたい人
- 既存のSNSが難しいと感じる人
- 生活の知恵・遊び・料理に興味がある人

### 主な利用シーン
見る側
- どんな投稿がされているか見たい時
- 料理のメニューを考えている時
- いつもと違う遊びをしてみたい時　など

投稿する側
- どんな事、どんな時でも共有したいことができた時。
- 日常の些細な出来事を共有したい時
- 料理がうまくいった時
- 以前遊んだ遊びを思い出した時
- その遊びを楽しんだ時
- 異世代との会話でギャップを感じた時　など

## 設計書
- 実装機能リスト(Googleスプレッドシート)  
https://docs.google.com/spreadsheets/d/1U1cLHh_dRo6lKX19gu-AxbUGHTFrCd6vS4bhVy42UP4/edit?gid=1513556476#gid=1513556476
- アプリケーション詳細設計書(Googleスプレッドシート)  
https://docs.google.com/spreadsheets/d/14UqPwOdZpeXUZ1Qb1ofBVvG5B3txuZM5px9zyMLG7i0/edit?gid=549108681#gid=549108681
- テーブル定義書(Googleスプレッドシート)  
https://docs.google.com/spreadsheets/d/1gD7PMXh9ddX1hD4iscB8WzidfG_m9jz-0QNLFT1DyrM/edit?gid=1044500859#gid=1044500859
- AWSインフラ設計書(Googleスプレッドシート)  
https://docs.google.com/spreadsheets/d/1BRg70RRYzd6uUX88rLwoBMkHHuraQ4kc1PuAF2djhHE/edit?gid=0#gid=0
- AWS構成図(diagrams.net)  
https://app.diagrams.net/?splash=0&libs=aws4#G1JAxtXoewVIfjsGtTrsVoFJHUkitCzdlT#%7B%22pageId%22%3A%223Qa-Rb4EaQss_YrXUZWA%22%7D

## 実装機能
- ゲストログイン
- 会員機能
- 投稿機能
- 投稿検索機能(キーワード検索)
- ユーザー管理機能（管理者）
- 投稿管理機能（管理者）
- いいね(ブックマーク)機能
- いいね(ブックマーク)一覧表示機能
- フォロー機能
- フォロー・フォロワー一覧表示機能
- コメント機能
- ユーザー・投稿検索機能
- タブ切り替え機能(cocoon)
- ページネーション(スクロール時に自動読み込み)
- 画像登録前表示機能(画像プレビュー機能)(js)

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery jscroll
- IDE：Cloud9
​
## 使用素材
- Canva(キャンバ)
- https://www.canva.com/
