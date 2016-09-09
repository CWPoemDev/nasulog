# nasulog

ポエムを書きためるWebアプリケーション。[pplog](https://www.pplog.net/)のような何か。

## ポエム

熱い想いとかやりたいこととかポエムに書くといいと思う。でもそればっかりだと暑苦しいので個人的な反省とか今やってることとかも自由にかけるとなおよいと思う。

nasum

## 参考URL

* [ポエム駆動開発によるWEBサービスの作り方 pplog誕生ものがたり](http://ppworks.hatenablog.jp/entry/2014/07/13/012855)
* [会社で「ポエム」を綴ろう！ ～ポエム駆動で理想を語ると社内の風が変わる！～](http://gihyo.jp/lifestyle/serial/01/poem-driven/0001)

## 開発環境構築

### 必要になるもの

* Ruby (2.3.0)
* MySQL
* nodejs
* v8
* Google のトークン
* Docker for Mac

### 準備

#### Google OAuth を設定する

* [Google Developers Console](https://console.developers.google.com/) で nasulog 用のプロジェクトを作る
* 作ったプロジェクトの Credentials ページから OAuth consent screen を設定する
  * とりあえず必須項目の Product name shown to users だけ入力すれば ok
* Create client ID からクライアントIDを作る
  * Application type は web application を選択
  * Authorized redirect URIs は `http://localhost:3000/auth/google_oauth2/callback` としておく (ドメインやポート番号はローカルの環境に合わせる)
* プロジェクトの Overview ページの Google APIs から、"Google+ API" を enable にする

#### .env.exampleをコピーし .env に環境変数を書いておく

```bash
cp .env.example .env
```

#### ミドルウェアの起動

```bash
docker-compose -f docker-compose.yml up
```

#### Rails アプリケーションの初期設定

```bash
$ ./bin/setup
```

#### 動作確認

```bash
$ ./bin/rails s
```

[localhost:3000](http://localhost:3000/) をブラウザで開いて「ログイン」→環境変数の RESTRICT_DOMAIN に設定したドメインのアカウントで許可を出してトップページまで戻り、エラーが表示されていなければ ok

### テスト

```bash
$ ./bin/rake spec
```

### 環境構築手順に変更が生じた場合

* 可能であれば `bin/setup` に手順を追加
* それが無理なら README.md に追記を

## Heroku

### nodejsの設定

- heroku config:set BUILDPACK_URL=https://github.com/heroku/heroku-buildpack-multi.git

### MySQLの設定

- ClearDB
- JawsDB

Add-onsで`mysql`で検索して上記のいずれかを追加。生成される環境変数の`CLEARDB_DATABASE_URL`を`DATABASE_URL`として追加する。

※ その際に`mysql`の部分を`mysql2`に設定する
