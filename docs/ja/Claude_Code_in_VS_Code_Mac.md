[ホーム](./)

# MacでVS CodeからClaude Codeを使う

MacにClaude Codeを入れたら、次は「ファイルを編集しながらClaudeと会話したい」という場面が増えます。Visual Studio Code (VS Code) を使えば、エディターとターミナルが1ウィンドウに収まり、片側でファイルを編集しつつ、もう片側で`claude`を操作できます。

## 3つのキーポイント

- **VS Code**：Microsoft製の無料エディター。Macで動き、拡張機能も豊富
- **統合ターミナル**：VS Code下部にあるターミナルパネル。ここで`claude`を実行
- **エクスプローラーパネル**：左側のファイルツリー。Claudeが作ったファイルも即座に表示されます

## 事前に済ませておくこと

- [MacにClaude Codeをインストール](./Install_Claude_Code_MacOS)
- [VS Codeの基本](./VS_Code_Getting_Started)でインターフェースに慣れておく
- 作業時間の目安：10〜15分

---

## ステップ1：VS Codeを起動

1. **Finder > アプリケーション**にある **Visual Studio Code** をダブルクリック
2. 「インターネットからダウンロードされたアプリです」と出たら **開く** を選択
3. Welcomeタブは閉じてOK

> Dockからすぐ開けるよう、アイコンを右クリック → **オプション > Dockに追加** にしておくと便利です。

## ステップ2：作業用フォルダを作成

1. Finderで **書類** フォルダを開く
2. **Shift + Command + N** で新規フォルダを作り、`test_claude` と命名

## ステップ3：VS Codeでフォルダを開く

1. VS Codeメニューの **ファイル > フォルダーを開く**
2. `書類 > test_claude` を選択して **開く**
3. 「作成者を信頼しますか？」と聞かれたら **はい** を選択

左側のエクスプローラーに `TEST_CLAUDE` が表示されます。

## ステップ4：統合ターミナルでClaude Codeを起動

1. **ターミナル > 新しいターミナル** を選択
2. 下部に開いたターミナルで以下を入力：
   ```bash
   claude
   ```
3. Claude Codeのインターフェースが立ち上がります

これで「左：ファイル」「下：Claude」という構成が完成です。

## ステップ5：動作確認のミニワーク

Claudeに次の指示を出してみましょう：
```
Write a short article explaining why LLMs like to use Markdown format. Save it as article.md
```
- 数秒後、エクスプローラーに `article.md` が表示されます
- ファイルをクリックするとVS Codeのエディターで内容を閲覧・編集可能
- プレビューを見たいときは、タブを右クリック → **プレビューを開く**

## VS Codeを閉じたあとに再開するには

- **方法A（おすすめ）**：VS Codeを起動 → **ファイル > 最近使った項目** から `test_claude` を選ぶ
- **方法B**：通常のターミナルで `cd ~/Documents/test_claude` → `code .`

VS Codeは最近のフォルダを覚えているので、方法Aが最速です。

## 次のアクション例

- `Explain what this project does` と聞いて既存コードの概要を掴む
- `Add a function that calculates the average of a list` のように機能追加を依頼
- `This code gives an error, can you fix it?` でバグ修正をお願い
- 拡張機能ビューで「Claude Code」を検索し、VS Code向け拡張版も試す

## よくある質問 / トラブル

| 症状 | 対処 |
| --- | --- |
| ターミナルに `zsh` だけ表示され `claude` が起動しない | `claude --version` でインストール済みか確認。未インストールなら[セットアップガイド](./Install_Claude_Code_MacOS)へ |
| `code` コマンドがターミナルで使えない | VS Codeで `Command + Shift + P` → “shell command”と入力 → **Shell Command: Install 'code' command in PATH** を実行 |
| 「不明な開発元」エラーでVS Codeが開けない | **システム設定 > プライバシーとセキュリティ** の下部にある **このまま開く** をクリック |

## ワークフローの全体像

1. VS Codeがビジュアル編集を担当
2. 統合ターミナルで `claude` を起動し、自然言語で依頼
3. ファイルは通常通り `~/Documents` などのフォルダに保存
4. エディターでコードを眺めながら、同じ画面でClaudeとチャットできる

---

[Steven Ge](https://www.linkedin.com/in/steven-ge-ab016947/) 作成（2025年12月10日）
