[ホーム](./)

# MacにClaude Codeをインストール

このガイドでは、MacにClaude Codeをインストールする方法を説明します。各ステップには初心者向けの詳細な手順が含まれています。

## 概要

- Node.jsをダウンロードしてインストール
- npmを使ってClaude Codeをインストール
- APIキーを設定
- Claude Codeを使う準備完了！

## 必要なもの

- Macコンピュータ（macOS 10.15 Catalina以降推奨）
- インターネット接続
- コンピュータの管理者権限
- Claude Pro/MaxサブスクリプションまたはAPIキー
- 15〜20分

## ステップ1：Node.jsをダウンロード

Claude CodeにはNode.jsバージョン18以上が必要です。

**まず、Node.jsがすでにインストールされているか確認：**

- キーボードで**Command (⌘) + Space**を押す
- 検索ボックスに`ターミナル`と入力
- **ターミナル**をクリック（黒い四角いアイコン）
- ターミナルで以下を入力：
   ```
   node --version
   ```
- 結果を確認：
   - **`v18.x.x`以上のバージョン番号が表示された場合**：Node.jsはすでにインストールされています！ステップ4に進んでください。
   - **「command not found」と表示された場合**：以下のインストールを続行してください。

**Node.jsをダウンロード：**

- Webブラウザを開く（Safari、Chrome、Firefoxなど）
- 以下のウェブサイトにアクセス：
   ```
   https://nodejs.org/
   ```
- Node.jsのホームページが表示されます
- 緑色の**Get Node.js**ボタンをクリック
- 画面中央の**macOS Installer (.pkg)**という緑色のボタンをクリック
- ファイルがダウンロードフォルダにダウンロードされます（通常30〜60秒かかります）
   - ファイル名は`node-v24.x.x.pkg`のようになります

## ステップ2：Node.jsをインストール

- **Finder**を開く（Dockの青い笑顔アイコンをクリック）
- 左サイドバーの**ダウンロード**をクリック
- ダウンロードしたファイルを見つける（`node-v24.x.x.pkg`のような名前）
- ファイルをダブルクリックして開く
- インストーラーウィンドウが表示されます - **続ける**をクリック
- ライセンス画面でもう一度**続ける**をクリック
- ライセンスに同意するために**同意する**をクリック
- **インストール**をクリック
- Macのパスワード（ログインに使用するもの）を求められます
- パスワードを入力して**ソフトウェアをインストール**をクリック
- インストールが完了するまで待ちます（1〜2分）
- 「インストールが成功しました」と表示されたら**閉じる**をクリック
- 求められた場合、インストーラーをゴミ箱に移動できます

## ステップ3：Node.jsのインストールを確認

- キーボードで**Command (⌘) + Space**を押す
- 検索ボックスに`ターミナル`と入力
- **ターミナル**をクリック（黒い四角いアイコン）
- 白または黒の背景とテキストのウィンドウが開きます - これがターミナルです
- ターミナルで以下を入力：
   ```
   node --version
   ```
- `v24.x.x`のような表示が見えるはずです（正確な数字は異なる場合があります）
- バージョン番号が表示されれば、Node.jsは正しくインストールされています

**「command not found」と表示された場合：**
- ターミナルを完全に閉じる（**Command (⌘) + Q**を押す）
- ターミナルを再度開く
- コマンドを再度試す

**ヒント：** 次のステップのためにターミナルを開いたままにしておいてください。

## ステップ4：Claude Codeをインストール

- ターミナルで以下を入力：
   ```
   sudo npm install -g @anthropic/claude-code
   ```
- Macのパスワードを求められます
- パスワードを入力（入力中は表示されません）
- Claude Codeがインストールされるまで待ちます（2〜5分）
- 黄色や赤色のテキストで警告が表示されることがありますが、通常は正常です
- インストールが完了したら、以下を入力して確認：
   ```
   claude --version
   ```
- Claude Codeのバージョン番号が表示されるはずです

## ステップ5：Anthropic APIとリンク

### オプションA. Claude ProまたはMaxサブスクリプションを使用

- ターミナルで以下を入力：
   ```
   claude
   ```
- Claudeがブラウザを開こうとします。自動的に開かない場合は、**Command (⌘)**を押しながら長いURLをクリックしてブラウザで開きます。または、URLをコピーしてブラウザに貼り付けます。
- Claude.aiアカウントにログイン（自動的に行われることがあります）
- **認証**をクリック
- 長いコードが表示されたら**コードをコピー**をクリック
- ターミナルウィンドウに戻る
- ターミナルに貼り付けるには：**右クリック**して**貼り付け**を選択（または**Command (⌘) + V**を押す）
- 成功メッセージが表示されるはずです
- 指示に従ってセットアップを完了

### オプションB. Anthropic APIキーを使用

Claudeサブスクリプションの代わりにAnthropic APIキーがある場合：

- まず、[Anthropicコンソール](https://console.anthropic.com/)からAPIキーを取得
- ターミナルで以下を入力：
   ```
   export ANTHROPIC_API_KEY="your-api-key-here"
   ```
   `your-api-key-here`を実際のAPIキーに置き換えてください
- これを永続的にする（毎回設定しなくて済むように）には、シェルプロファイルに追加：
   ```
   echo 'export ANTHROPIC_API_KEY="your-api-key-here"' >> ~/.zshrc
   ```
   `your-api-key-here`を実際のAPIキーに置き換えてください
- 変更を有効にするには、ターミナルを閉じて再度開く
- これでAPIキーでClaude Codeを使用できるはずです

**重要：** Claude ProまたはMaxサブスクリプションがある場合、ANTHROPIC_API_KEY環境変数を設定しないでください。サブスクリプションの使用量を使用し、予期しないAPI料金を避けるために、未設定のままにしてください。

**注意：** zshの代わりにbashを使用している古いMacの場合、上記のコマンドの`~/.zshrc`を`~/.bash_profile`に置き換えてください。

### オプションC. Azure経由でAnthropic APIを使用

ターミナルウィンドウで、環境変数を定義するために以下のコードを貼り付けます：
```
# Microsoft Foundry統合を有効化
export CLAUDE_CODE_USE_FOUNDRY=1
# Azureリソース名
export ANTHROPIC_FOUNDRY_RESOURCE=xxxx-eastus2
# モデルをリソースのデプロイメント名に設定
export ANTHROPIC_DEFAULT_OPUS_MODEL=claude-opus-4-5
export ANTHROPIC_DEFAULT_SONNET_MODEL=claude-sonnet-4-5
export ANTHROPIC_FOUNDRY_API_KEY=your_api_key
```

これでAzureにデプロイされたClaudeモデルでClaude Codeを使用できるはずです。

**注意：** `xxxx-eastus2`をFoundryリソース名に置き換えてください（完全なベースURLは使用しないでください）。`your_api_key`をAzureポータルから取得した完全なAPIキーに置き換えてください。

## ステップ6：Claude Codeを使い始める

準備完了です！Claude Codeの使い方：

- ターミナルで以下を入力：
   ```
   claude
   ```
- これでClaudeとチャットできます！
- 動作を確認するには、「量子コンピューティングについて説明してください」などの一般的な質問をしてみてください。

## ステップ7：プロジェクトに移動

- Macフォルダにプロジェクトがある場合、そこに移動できます：
   ```
   cd ~/Documents/YourProject
   ```
   `YourProject`を実際のプロジェクトフォルダ名に置き換えてください

- その後、Claudeを起動：
   ```
   claude
   ```
- まずClaudeにコードベースを説明してもらうことから始めましょう。
- Claudeに変更を依頼できます。
- お好みのIDEでコードをテストしてください。

## 再びターミナルを開く方法

ターミナルを閉じた後、再び開く方法：

- **Command (⌘) + Space**を押す（またはDockの**Launchpad**をクリック）
- `ターミナル`と入力
- **ターミナル**をクリック
- ターミナルウィンドウが開きます

## トラブルシューティング

### Node.jsインストーラーが開かない
- nodejs.orgから`.pkg`ファイルをダウンロードしたことを確認
- ダブルクリックの代わりにファイルを右クリックして**開く**を選択してみてください
- **システム設定** > **プライバシーとセキュリティ**に移動して**このまま開く**をクリック

### インストール後に「node: command not found」
- ターミナルを完全に閉じる（**Command (⌘) + Q**を押す）
- ターミナルを再度開く
- `node --version`を再度試す
- まだ動作しない場合、Macを再起動して再度試してください

### npmインストールがパーミッションエラーで失敗
- npmコマンドの前に`sudo`を使用：
  ```
  sudo npm install -g @anthropic/claude-code
  ```
- プロンプトが表示されたらMacのパスワードを入力

### Claude Codeコマンドが見つからない
- npmインストールが正常に完了したことを確認
- ターミナルを閉じて再度開いてみてください
- Claude Codeがインストールされているか確認：`npm list -g @anthropic/claude-code`
- 再インストールを試す：`sudo npm uninstall -g @anthropic/claude-code`の後に`sudo npm install -g @anthropic/claude-code`

### 「Cannot find module」エラー
- Node.jsが正しくインストールされていることを確認：`node --version`
- Claude Codeを再インストール：`sudo npm uninstall -g @anthropic/claude-code`の後に`sudo npm install -g @anthropic/claude-code`

## Macユーザー向けのヒント

### プロジェクトパスを見つける
フォルダへのパスを見つけるには：
- Finderを開く
- プロジェクトフォルダに移動
- フォルダをターミナルにドラッグ＆ドロップ - フルパスが表示されます！

### キーボードショートカット
- **Command (⌘) + T**：新しいターミナルタブを開く
- **Command (⌘) + N**：新しいターミナルウィンドウを開く
- **Command (⌘) + K**：ターミナル画面をクリア
- **Control + C**：実行中のコマンドを停止

### 異なるターミナルアプリの使用
他のターミナルアプリも使用できます：
- iTerm2（より多くの機能を持つ人気の代替品）
- Warp（AI機能を持つモダンなターミナル）
- Hyper（クロスプラットフォームターミナル）

Claude Codeはすべてで動作します！

## ヘルプが必要ですか？

- Node.jsのダウンロードについて：[Node.js公式ウェブサイト](https://nodejs.org/)
- Node.jsの問題について：[Node.jsドキュメント](https://nodejs.org/docs/)
- npmの問題について：[npmドキュメント](https://docs.npmjs.com/)
- Claude Codeの問題について：[Claude Code GitHub](https://github.com/anthropics/claude-code)
