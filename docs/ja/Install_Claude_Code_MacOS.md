[ホーム](./)

# MacにClaude Codeをインストール

このガイドでは、MacにClaude Codeをセットアップする手順を最初から最後まで説明します。初心者でも迷わないよう、各ステップを細かく分けて記載しています。

## 概要

- Node.jsをダウンロードしてインストール
- npmでClaude Codeをインストール
- APIキー（またはサブスクリプション）を設定
- Claude Codeを使って作業開始

## 用意するもの

- Mac（macOS 10.15 Catalina以降を推奨）
- インターネット接続
- コンピュータの管理者権限
- Claude Pro/MaxサブスクリプションまたはAnthropic APIキー
- 作業時間の目安：15〜20分

## ステップ1：Node.jsをダウンロード

Claude CodeにはNode.js 18以上が必要です。まず現在の環境を確認しましょう。

**Node.jsが入っているか確認する：**

- **Command (⌘) + Space**を押し、`ターミナル`と入力して**ターミナル**を開く（黒い四角アイコン）
- ターミナルで以下を入力：
  ```
  node --version
  ```
- 結果を確認：
  - **`v18.x.x`以上の数字が表示された場合**：Node.jsはすでにあります。**ステップ4**に進んでください。
  - **「command not found」と表示された場合**：続けてNode.jsをインストールします。

**Node.jsをダウンロードする：**

- Safari / Chrome / Firefox などのブラウザを開く
- 以下のURLを開く：
  ```
  https://nodejs.org/
  ```
- Node.jsのトップページが開いたら、緑の **Get Node.js** ボタンをクリック
- 画面中央の **macOS Installer (.pkg)** をクリック
- ダウンロードフォルダに`node-v24.x.x.pkg`のようなファイルが保存されます（30〜60秒程度）

## ステップ2：Node.jsをインストール

- Dockの青い顔アイコンから**Finder**を開く
- 左側の**ダウンロード**をクリック
- 先ほどの`node-v24.x.x.pkg`を見つけてダブルクリック
- インストーラーが開いたら手順に従う：
  - **続ける**をクリック
  - ライセンス画面でもう一度**続ける**→**同意する**
  - **インストール**をクリック
  - Macのログインパスワードを入力し、**ソフトウェアをインストール**
  - 1〜2分待ち、「インストールが成功しました」と表示されたら**閉じる**
  - メッセージが出た場合はインストーラをゴミ箱に移動してOK

## ステップ3：Node.jsが入ったか確認

- もう一度 **Command (⌘) + Space** でターミナルを開く
- 次のコマンドを実行：
  ```
  node --version
  ```
- `v24.x.x`のような表示が出れば成功です（数字は多少違っていても問題ありません）

**「command not found」が出た場合：**
- **Command (⌘) + Q**でターミナルを終了→再度開いてコマンドを試す
- それでも駄目ならMacを再起動して再実行

> **ヒント：** この後もターミナルを使うので、開いたままにしておくと便利です。

## ステップ4：Claude Codeをインストール

- ターミナルで以下を実行：
  ```
  sudo npm install -g @anthropic/claude-code
  ```
- パスワード入力を求められたら、Macのログインパスワードを入力（画面には表示されません）
- 2〜5分ほど待つとインストールが完了します。黄色や赤の警告が出る場合がありますが、多くは問題ありません。
- 完了後、次で確認：
  ```
  claude --version
  ```
- Claude Codeのバージョン番号が表示されればインストール成功です。

## ステップ5：Anthropic APIにリンク

### オプションA：Claude Pro/Maxサブスクリプションを使う

- ターミナルで以下を入力：
  ```
  claude
  ```
- Claudeがブラウザを開きます。自動で開かない場合は、**Command (⌘)** を押しながら長いURLをクリック、またはURLをコピーしてブラウザに貼り付けてください。
- Claude.aiにログイン（自動ログインされることもあります）
- **Authorize**をクリック
- 表示された長いコードで**Copy Code**をクリック
- ターミナルに戻り、右クリック > **貼り付け** または **Command (⌘) + V** でコードを貼り付ける
- 成功メッセージが出たらセットアップ完了です。

### オプションB：Anthropic APIキーを使う

Claudeサブスクリプションの代わりにAPIキーを使う場合：

1. [Anthropic Console](https://console.anthropic.com/)でAPIキーを取得
2. ターミナルで以下を入力（`your-api-key-here`を自分のキーに置き換え）：
   ```
   export ANTHROPIC_API_KEY="your-api-key-here"
   ```
3. 毎回設定するのが面倒な場合は、シェル設定へ追記：
   ```
   echo 'export ANTHROPIC_API_KEY="your-api-key-here"' >> ~/.zshrc
   ```
4. ターミナルを閉じて開き直すと設定が反映され、Claude CodeでAPIキーが利用できます。

> **重要：** Claude Pro/Maxを利用している場合は `ANTHROPIC_API_KEY` を設定しないでください。サブスクリプション枠を優先的に使い、意図しないAPI課金を避けられます。
>
> **補足：** 古いMacでbashを使っている場合は `~/.zshrc` の代わりに `~/.bash_profile` を指定してください。

### オプションC：Azure経由のAnthropic APIを使う

ターミナルで以下を貼り付け、Azure Foundry向けの環境変数を設定します：
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
`xxxx-eastus2`は自分のFoundryリソース名に、`your_api_key`はAzureポータルで発行した完全なAPIキーに置き換えてください。設定後は、Azure上のClaudeモデルをClaude Codeから呼び出せます。

## ステップ6：Claude Codeを使ってみる

準備完了です！

- ターミナルで：
  ```
  claude
  ```
- これでClaudeとチャットできます。動作確認として「量子コンピューティングについて説明して」などの質問を投げてみてください。

## ステップ7：プロジェクトフォルダで作業する

- Mac内のプロジェクトフォルダへ移動：
  ```
  cd ~/Documents/YourProject
  ```
  `YourProject`を実際のフォルダ名に置き換えます。
- そのフォルダで`claude`を起動すれば、該当プロジェクトのファイルを直接扱えます。
- まずは「このコードベースが何をするのか説明して」と聞き、状況を把握しましょう。
- 修正や追加をClaudeに依頼し、完了したらお好みのIDEでテストします。

## ターミナルを再度開く方法

- **Command (⌘) + Space**を押す、またはDockから**Launchpad**を開く
- `ターミナル`と入力して**ターミナル**をクリック
- 新しいターミナルウィンドウが開きます

## トラブルシューティング

### Node.jsインストーラーが開かない
- nodejs.orgからダウンロードした`.pkg`ファイルか確認
- ダブルクリックではなく右クリック > **開く**を試す
- **システム設定** > **プライバシーとセキュリティ**の下部にある**このまま開く**をクリック

### インストール後に「node: command not found」と表示される
- **Command (⌘) + Q**でターミナルを終了→再起動
- `node --version`を再実行
- それでも解決しない場合はMacを再起動してやり直す

### npmインストールがパーミッションエラーで失敗する
- `sudo`を付けて再実行：
  ```
  sudo npm install -g @anthropic/claude-code
  ```
- プロンプトが表示されたらパスワードを入力

### Claude Codeコマンドが見つからない
- npmのインストールが最後まで完了したか確認
- ターミナルを再起動
- 次でインストール状況を確認：`npm list -g @anthropic/claude-code`
- 必要なら再インストール：
  ```
  sudo npm uninstall -g @anthropic/claude-code
  sudo npm install -g @anthropic/claude-code
  ```

### 「Cannot find module」エラー
- `node --version`でNode.jsの動作を確認
- 上記の手順でClaude Codeを再インストール

## Macで便利な小ワザ

### プロジェクトパスを簡単に取得
1. Finderで目的のフォルダを開く
2. そのフォルダをターミナルウィンドウへドラッグ＆ドロップ
3. 自動でフルパスが挿入されます

### よく使うキーボードショートカット
- **Command (⌘) + T**：ターミナルの新規タブ
- **Command (⌘) + N**：ターミナルの新規ウィンドウ
- **Command (⌘) + K**：画面クリア
- **Control + C**：実行中のコマンドを停止

### ほかのターミナルアプリを使う
- **iTerm2**：多機能で人気のターミナル
- **Warp**：AI機能を備えたモダンなターミナル
- **Hyper**：クロスプラットフォームで動作

Claude Codeはどのターミナルアプリでも動作します。

## 困ったときは

- Node.jsのダウンロード： [Node.js公式サイト](https://nodejs.org/)
- Node.jsの問題： [Node.jsドキュメント](https://nodejs.org/docs/)
- npmの問題： [npmドキュメント](https://docs.npmjs.com/)
- Claude Codeの問題： [Claude Code GitHub](https://github.com/anthropics/claude-code)
