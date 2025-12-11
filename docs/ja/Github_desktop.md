[ホーム](./)

# バージョン管理を始めよう

プロジェクトで作業していて、すべてを壊す変更を加えてしまいました。何を変更したか覚えていなくて、動いていた時に戻りたい。バージョン管理はビデオゲームのセーブポイントのようなものです - 作業を「コミット」するたびに、いつでも戻れる復元ポイントを作成します。[GitHub](https://github.com)はセーブポイントをクラウドに保存するので、コードは安全にバックアップされ、どのコンピュータからでもアクセスできます。

## 主要な概念

- **Git** - コンピュータ上のファイルへの変更を追跡するバージョン管理ソフトウェア
- **GitHub** - コードをクラウドに保存するウェブサイト、コード用のGoogleドライブのようなもの
- **GitHub Desktop** - Gitを簡単に使えるアプリ、コマンドの代わりにボタンをクリック
- **リポジトリ（リポ）** - すべての変更を追跡するプロジェクトフォルダ

## 必要なもの

- Windows、macOS、またはLinuxコンピュータ
- インターネット接続
- GitHubアカウント用のメールアドレス
- 15〜20分

## ステップ1：GitHubアカウントを作成

- Webブラウザを開く
- [github.com](https://github.com)にアクセス
- **Sign up**をクリック
- メールアドレスを入力し、パスワードを作成し、ユーザー名を選択
- 確認手順を完了

## ステップ2：GitHub Desktopをダウンロード

- [desktop.github.com](https://desktop.github.com)にアクセス
- **ダウンロード**ボタンをクリック
- ダウンロードしたファイルを開いてインストール

**Windowsの場合：**
- インストーラーファイルをダブルクリック
- GitHub Desktopがインストールされ、自動的に開きます

**Macの場合：**
- ダウンロードした`.zip`ファイルを開く
- **GitHub Desktop**をアプリケーションフォルダにドラッグ
- アプリケーションからGitHub Desktopを開く

## ステップ3：GitHub Desktopにサインイン

- GitHub Desktopを開く
- **Sign in to GitHub.com**をクリック
- ブラウザが開きます - **Authorize desktop**をクリック
- GitHub Desktopに戻る
- **Finish**をクリックしてセットアップを完了

## ステップ4：最初のリポジトリを作成

- GitHub Desktopで、**Create a New Repository on your Hard Drive**をクリック
- フォームに記入：
  - **Name：** `my-first-project`（またはお好きな名前）
  - **Description：** `バージョン管理を学習中`（オプション）
  - **Local Path：** 保存場所を選択（書類フォルダで可）
  - **Initialize this repository with a README**にチェック
- **Create Repository**をクリック

## ステップ5：プロジェクトフォルダを開く

- GitHub Desktopで、メニューバーの**Repository**をクリック
- **Show in Finder**（Mac）または**Show in Explorer**（Windows）を選択
- プロジェクト名のフォルダが表示されます
- 中には`README.md`というファイルがあります

## ステップ6：最初の変更を加える

- `README.md`を任意のテキストエディター（メモ帳、テキストエディット、またはVS Code）で開く
- 内容を以下に置き換える：
  ```
  # マイファーストプロジェクト

  GitHub Desktopでバージョン管理を学んでいます。

  ## 作っているもの

  これは以下を学ぶための練習プロジェクトです：
  - コードへの変更を追跡
  - セーブポイント（コミット）を作成
  - GitHubに作業をバックアップ
  ```
- **ファイル** → **保存**をクリック

## ステップ7：最初のコミット（セーブポイント）を作成

- GitHub Desktopに戻る
- 右側に変更がハイライトされています（緑 = 追加、赤 = 削除）
- 左下にコミットメッセージを入力：`READMEにプロジェクト説明を更新`
- 青い**Commit to main**ボタンをクリック

## ステップ8：GitHubにプッシュ（クラウドにバックアップ）

- 上部の青い**Publish repository**ボタンをクリック
- 名前はそのまま
- 他の人に見せたい場合は「Keep this code private」のチェックを外す（オプション）
- **Publish Repository**をクリック

コードがオンラインでバックアップされました：`https://github.com/YOUR-USERNAME/my-first-project`

## 次のステップ

- READMEファイルを再度編集して変更をコミット
- プロジェクトフォルダに新しいファイルを作成してコミット
- **History**タブを探索してプロジェクトがどう進化するか確認

## トラブルシューティング

- **GitHubにサインインできない** - インターネット接続を確認。まずgithub.comでサインインして認証情報が動作するか確認。
- **変更がGitHub Desktopに表示されない** - ファイルを保存したことを確認。**Repository** → **Refresh**をクリックするか、GitHub Desktopを再起動。
- **プッシュが「rejected」エラーで失敗** - 他の誰かが変更をプッシュしました。まず**Fetch origin**をクリックしてから、再度プッシュを試みてください。

## ワークフロー概要

- プロジェクトファイルに変更を加える
- GitHub Desktopで変更を確認（緑 = 追加、赤 = 削除）
- 説明的なコミットメッセージを書いて**Commit to main**をクリック
- **Push origin**をクリックしてGitHubにバックアップ
- 繰り返す

---

[Steven Ge](https://www.linkedin.com/in/steven-ge-ab016947/)が2025年12月7日に作成。
