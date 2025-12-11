[ホーム](./)

# Windows版Claude Codeでローカルバージョン管理

Claude Codeに作業を任せると、ファイルが自動で書き換えられます。成功することもあれば、期待外れの結果になることもあります。そこで役立つのがGitです。**Gitはプロジェクト全体に対する「やり直しボタン」**。スナップショット（コミット）を残しておけば、いつでも安全な地点に戻れます。しかも操作はすべてClaude Codeに頼めます。

## 主要な概念

- **WSL (Windows Subsystem for Linux)**：Linuxツール（Gitなど）をWindows上でそのまま実行できる仕組み
- **Git**：ファイルの変更履歴をすべて記録し、任意の時点に戻れるようにするバージョン管理システム
- **コミット**：特定の時点でのプロジェクトの状態を説明付きで保存したもの
- **Claude Code**：自然言語で指示するだけでコード作成・修正・Git操作まで行ってくれるAIアシスタント

## 準備するもの

- [WindowsにClaude Codeをインストール](./Install_CLAUDE_Code_Win)済み
- 作業時間の目安：20分

---

## ステップ1：Ubuntuターミナルを開く

1. **Windowsスタートボタン**をクリック
2. `Ubuntu` と入力し、表示された **Ubuntu** アプリを開く
3. `$` や `%` で終わるプロンプトが表示されたら準備完了です

## ステップ2：Gitをインストール

```bash
sudo apt-get install git
```
- パスワード入力後、数十秒で完了します
- 確認：
  ```bash
  git --version
  ```
  `git version ...` と表示されればOK

## ステップ3：Gitに身元情報を登録

コミットログに誰が変更したかを残すため、名前とメールアドレスを設定します（実名でなくても構いません）。

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

## ステップ4：Windows上のフォルダへ移動

WSLではWindowsドライブを `/mnt/c/` から参照できます。

```bash
cd /mnt/c/Users/YOUR_USERNAME/Documents
pwd
```
`YOUR_USERNAME` を自分のユーザー名に置き換えると、`/mnt/c/Users/…/Documents` と表示されるはずです。

## ステップ5：プロジェクトフォルダを用意

```bash
mkdir timer
cd timer
```
ここがタイマーアプリの作業フォルダになります。

## ステップ6：Claude Codeを起動

```bash
claude
```
Claude Codeが立ち上がり、指示待ちの状態になります。

## ステップ7：Gitリポジトリを初期化

Claude Codeにこうお願いしてください：
```
Start tracking changes
```
数秒でGitリポジトリが作成され、バージョン管理の準備が整います。

## ステップ8：タイマーアプリを作成

Claude Codeに以下を送信します：
```
Create a simple countdown timer app in a single file called timer.html.
It should have:
- An input field to set minutes
- Start and Stop buttons
- Display showing time remaining in MM:SS format
```
`tamar.html` が生成され、HTML/CSS/JavaScriptが書かれます。

## ステップ9：ブラウザで動作確認

1. Windowsの**エクスプローラー**で `Documents\timer` を開く
2. `timer.html` をダブルクリックしてブラウザで開く
3. 入力欄に `1` と入力 → **Start** をクリック → カウントダウンを確認
4. 不具合があればClaudeに「こんなエラーが出た。直せる？」と伝えましょう

## ステップ10：Claudeにコミットを依頼

```
Save these changes.
```
Claudeが変更ファイルの確認・メッセージ作成・コミットまで自動で行い、最初の復元ポイントができあがります。

## ステップ11：プリセットボタンを追加

```
Add two buttons on the top. If I click on them it automatically starts 1- and 5-minute timers.
```
- ブラウザを更新してボタンを確認
- 問題なければ再度 `Save these changes.` でコミット

## ステップ12：15分ボタンを試作

```
Add a 15-minute button.
```
ただし今回は「バグが出たことにする」想定。テスト後もコミットせずに次の練習へ進みます。

## ステップ13：失敗した変更を破棄

```
discard these changes.
```
- Claudeが確認を求めたら `yes`
- ブラウザを更新すると、問題のボタンだけが消えます

## ステップ14：アラーム音を追加

```
Add a sound notification when the timer reaches zero.
```
0.1分（6秒）で試し、成功したらコミットします。

## ステップ15：スヌーズボタンを追加

```
The sound should continue until I click a button to snooze it.
```
こちらもテスト後にコミット。

## ステップ16：コミット履歴を確認

```
show my change history
```
- 初期バージョン
- プリセットボタン
- サウンド通知
- スヌーズボタン
が並んでいるはずです。15分ボタンは破棄したので登場しません。

## ステップ17：コードを学ぶ

1. ブラウザでページを開き、右クリック → **ページのソースを表示**
2. Claudeに `Explain this code. Just big picture.` と頼むと、構造を説明してくれます。

---

## 1つのセッションで行ったこと

1. 変更をClaudeに依頼
2. ブラウザでテスト
3. 成功 ⇒ コミットを依頼
4. 失敗 ⇒ 修正依頼、直らなければ破棄
5. 必要に応じて繰り返し

この流れで「常に成功しているコードだけがコミットされる」状態を維持できます。

## 次のチャレンジ

- `Add a working 15-minute preset button`
- `Add a Pause/Resume button that toggles the timer state`
- `Improve the visual design with a modern color scheme`
- `Add a visual progress bar showing time remaining`

各ステップで必ずテスト → 成功したらコミット → 失敗したら破棄、というリズムを保ちましょう。

## トラブルシューティング

| 症状 | 対処 |
| --- | --- |
| `not a git repository` | `cd /mnt/c/Users/YOUR_USERNAME/Documents/timer` で正しいフォルダにいるか確認 |
| `timer.html` が見つからない | Windows側では `C:\Users\YOUR_USERNAME\Documents\timer\timer.html` にあります |
| Gitがパスワードを聞く | `sudo` パスワードの入力ミス。落ち着いて再入力 |
| タイマーが動作しない | ブラウザで **F12 → Console** を開き、赤いエラーをコピーしてClaudeに貼り付ける |

## Claudeに頼めること（例）

- `what files have I changed?`
- `show me the diff`
- `explain what the timer code does`
- `create a branch called experiment`
- `go back to the previous commit`

Gitコマンドを覚えなくても、自然言語で指示すればClaudeが処理してくれます。

## ワークフローまとめ

- **セットアップ**：Gitインストールとユーザー設定は最初に一度だけ
- **開発**：Claudeがコードを書き、あなたがブラウザで確認
- **バージョン管理**：コミット・差分確認・巻き戻しをすべてClaudeに依頼
- **安全性**：失敗した変更はすぐ破棄し、成功した状態だけ記録
- **ローカル作業**：すべてPC内で完結。余計なアカウントやクラウド不要

[Steven Ge](https://www.linkedin.com/in/steven-ge-ab016947/) 作成（2025年12月8日）
