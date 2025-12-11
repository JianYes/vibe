[ホーム](./)

# Mac版Claude Codeでローカルバージョン管理

Claude Codeに変更を任せると、コードベースはどんどん書き換わります。完璧に動くときもあれば、期待とは違う結果になることも。そんなとき、**Gitは「プロジェクト全体の取り消しボタン」**として力を発揮します。スナップショット（コミット）を積み重ねれば、いつでも安全な状態に戻れます。しかもコミットや差分確認といった操作もClaude Codeに任せられます。

## 主要な概念

- **ターミナル**：Macに標準搭載されているコマンドラインツール
- **Git**：変更履歴を記録し、復元ポイントを作るバージョン管理システム
- **コミット**：特定時点の状態を説明付きで保存するスナップショット
- **Claude Code**：自然言語の指示でコード作成やGit操作までこなすAIアシスタント

## 事前準備

- [MacにClaude Codeをインストール](./Install_Claude_Code_MacOS)済み
- 所要時間：20分程度

---

## ステップ1：ターミナルを開く

- **Spotlight**：`Command (⌘) + Space` → `ターミナル` と入力 → Enter
- **Finder**：**アプリケーション > ユーティリティ > ターミナル**
- **Launchpad**：DockのLaunchpad → 検索欄に `ターミナル`

`$` や `%` で終わるプロンプトが見えればOKです。

## ステップ2：Gitがあるか確認（なければインストール）

```bash
git --version
```
- `git version ...` と表示されればそのまま次へ
- 「command not found」や開発者ツールのインストーラが出た場合：
  ```bash
  xcode-select --install
  ```
  インストール後に再度 `git --version` を実行して確認してください

## ステップ3：Gitに名前とメールを登録

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```
表示される名前・メールは実際のものでなくても問題ありませんが、後から履歴を見返すときに役立ちます。

## ステップ4：書類フォルダへ移動

```bash
cd ~/Documents
pwd
```
`/Users/あなたのユーザー名/Documents` と表示されれば成功です。

## ステップ5：作業フォルダを作る

```bash
mkdir timer
cd timer
```
ここにタイマーアプリのファイルがまとまります。

## ステップ6：Claude Codeを起動

```bash
claude
```
Claude Codeが立ち上がり、次の指示を待つ状態になります。

## ステップ7：Gitリポジトリを初期化

Claude Codeに以下を送信：
```
Start tracking changes
```
2〜5秒でGitリポジトリが作成され、バージョン管理が有効になります。

## ステップ8：タイマーアプリを生成

```
Create a simple countdown timer app in a single file called timer.html.
It should have:
- An input field to set minutes
- Start and Stop buttons
- Display showing time remaining in MM:SS format
```
`tamar.html` が作成され、必要なHTML/CSS/JSが書き込まれます。

## ステップ9：Finderでテスト

1. **Finder**で `書類 > timer` フォルダを開く
2. `timer.html` をダブルクリックしてブラウザで開く
3. 入力欄に `1` と入力 → **Start** をクリック → カウントダウンが動くか確認
4. 不具合があれば `I'm seeing this error: ...` のようにClaudeに報告して修正を依頼

## ステップ10：Claudeにコミットを指示

```
Save these changes.
```
Claudeが変更を確認し、メッセージを付けてコミットを作成してくれます。これが最初の復元ポイントです。

## ステップ11：プリセットボタンを追加

```
Add two buttons on the top. If I click on them it automatically starts 1- and 5-minute timers.
```
- ブラウザを `Command (⌘) + R` で更新し、ボタンの動作を確認
- 問題なければ再度 `Save these changes.` でコミット

## ステップ12：15分ボタンを試作

```
Add a 15-minute button.
```
今回は「動かない想定」にします。テスト後もコミットせず、次の練習へ。

## ステップ13：失敗した変更を破棄

```
discard these changes.
```
- Claudeが確認したら `yes`
- ブラウザを更新すると15分ボタンが消え、安定した状態に戻ります

## ステップ14：サウンド通知を追加

```
Add a sound notification when time is up.
```
0.1分（約6秒）でテストし、成功したらコミットします。

## ステップ15：スヌーズボタンを追加

```
The sound should continue until I click a button to snooze it.
```
こちらもテスト後にコミット。

## ステップ16：コミット履歴を確認

```
show my change history
```
- 初期タイマー
- プリセットボタン
- サウンド通知
- スヌーズボタン
が並んでいるはずです。15分ボタンは破棄したので履歴に残りません。

## ステップ17：コードの全体像を学ぶ

1. ブラウザでページを開き、`Option (⌥) + Command (⌘) + U` でソースを表示
2. Claudeに `Explain this code. Just big picture.` と頼んで構造を説明してもらいます

---

## 作業フローのまとめ

1. Claudeに変更を依頼
2. ブラウザでテスト
3. 成功 → コミット依頼
4. 失敗 → 修正依頼 or 破棄
5. 必要量を満たすまで繰り返し

常に「動作する状態だけ」がコミットされるよう管理できます。

## 追加で試したいこと

- `Add a working 15-minute preset button`
- `Add a Pause/Resume button that toggles the timer state`
- `Improve the visual design with a modern color scheme`
- `Add a visual progress bar showing time remaining`

各機能のたびにテスト → 成功ならコミット → 失敗なら破棄、というリズムを守りましょう。

## トラブルシューティング

| 症状 | 対処 |
| --- | --- |
| `not a git repository` | `cd ~/Documents/timer` で正しいフォルダにいるか確認 |
| `timer.html` が見つからない | Finderで `書類/timer/timer.html` を探す |
| Gitコマンドが動かない | ステップ2の `git --version` を再確認。必要なら `xcode-select --install` |
| タイマーが動作しない | ブラウザで `Option (⌥) + Command (⌘) + I` → **Console** を開き、赤いエラーをClaudeへ貼り付け |

## Claudeにお願いできる代表例

- `what files have I changed?`
- `show me the diff`
- `explain what the timer code does`
- `create a branch called experiment`
- `go back to the previous commit`

Gitコマンドを覚えなくても、会話のように頼めばClaudeがすべて処理します。

## ワークフロー概要

- **セットアップ**：Gitのインストールとユーザー情報設定は最初に一度だけ
- **開発**：Claudeがコードを書き、あなたがMacのブラウザでテスト
- **バージョン管理**：コミット・差分・巻き戻しを自然言語で指示
- **安全性**：失敗した変更は即座に破棄。必要ならいつでも過去のコミットへ戻れる
- **ローカル完結**：作業はすべてMac内で完結し、追加のアカウントやクラウドは不要

[Steven Ge](https://www.linkedin.com/in/steven-ge-ab016947/) 作成（2025年12月8日）
