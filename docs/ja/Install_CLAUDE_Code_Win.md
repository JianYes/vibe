[ホーム](./)

# WSLを使ってWindowsにClaude Codeをインストール

このガイドでは、Windows Subsystem for Linux（WSL）を使ってWindowsにClaude Codeをインストールする方法を説明します。WSLを使うと、WindowsマシンでLinuxオペレーティングシステム（OS）を実行する仮想マシンが有効になります。Claude CodeはWindows上でネイティブにインストールすることもできますが、多くのコマンドにアクセスできるため、Linux環境の方がはるかに効率的に動作します。

## 概要

- WSLのインストール
- Ubuntu Linuxのセットアップ
- Node.jsのインストール
- Claude Codeのインストール
- APIキーの設定
- Claude Codeを使う準備完了！

## 必要なもの

- Windows 10（バージョン2004以降）またはWindows 11のコンピュータ
- インターネット接続
- コンピュータの管理者権限
- Claude Pro/Maxサブスクリプションまたはe APIキー
- 15〜20分

## ステップ1：仮想化が有効かチェック

WSLをインストールする前に、コンピュータで仮想化が有効になっていることを確認する必要があります。これはWSLが動作するために必要です。

- タスクバー（画面下部のバー）を**右クリック**
- メニューから**タスクマネージャー**をクリック
- タスクマネージャーが小さいウィンドウで開いた場合は、下部の**詳細**をクリック
- 上部の**パフォーマンス**タブをクリック
- 左サイドバーの**CPU**をクリック
- ウィンドウの右下セクションを確認
- **仮想化:**と書かれた行を見つけ、**有効**と表示されているか確認

**「有効」と表示されている場合：** 素晴らしい！ステップ2に進んでください。

**「無効」と表示されている場合：** コンピュータのBIOS設定で仮想化を有効にする必要があります：
- コンピュータを再起動
- 起動中にBIOSキーを押す（通常は**F2**、**F10**、**Del**、または**Esc** - コンピュータメーカーによって異なります）
- 「Virtualization Technology」、「Intel VT-x」、「AMD-V」、または「SVM Mode」に関連する設定を探す
- これらの設定を有効にする
- BIOSを保存して終了（通常は**F10**）
- コンピュータが通常通り再起動します

## ステップ2：管理者としてPowerShellを開く

- **Windowsスタートボタン**をクリック（左下のWindowsアイコン）
- 検索ボックスに`PowerShell`と入力
- 検索結果に**Windows PowerShell**が表示されます
- **Windows PowerShell**を**右クリック**
- メニューから**管理者として実行**をクリック
- 「このアプリがデバイスに変更を加えることを許可しますか？」というウィンドウがポップアップします
- **はい**をクリック

白いテキストの青いウィンドウが開きます - これが管理者として実行されているPowerShellです。

## ステップ3：WSLをインストール

**まず、WSLとUbuntuがすでにインストールされているか確認：**

- PowerShellウィンドウで以下を入力：
   ```
   wsl --list --verbose
   ```
- 結果を確認：
   - **「Ubuntu」が「Running」または「Stopped」のSTATEでリストされている場合**：WSLとUbuntuはすでにインストールされています！ステップ4に進んでください。
   - **エラーメッセージが表示される場合**、または「Windows Subsystem for Linuxにはインストールされているディストリビューションがありません」：以下のインストールを続行してください。

**WSLとUbuntuをインストール：**

- PowerShellウィンドウで以下を入力：
   ```
   wsl --install
   ```
- 「Installing: Windows Subsystem for Linux」や「Installing: Ubuntu」などのメッセージが表示されることがあります
- インストール完了のメッセージが表示されたら、コンピュータを再起動する必要があります：
   - **Windowsスタートボタン**をクリック
   - **電源アイコン**をクリック
   - **再起動**をクリック
- コンピュータが再起動します - 約1〜2分かかります

**再起動後の動作：**
- Windowsに再ログインした後、2〜5分待ちます
- インストールを続行するためにUbuntuターミナルウィンドウが**自動的に表示**されるはずです
- これは正常です！セットアップを完了するためにウィンドウが自動的に開きます
- 5分経ってもウィンドウが表示されない場合は、心配しないでください - Ubuntuを手動で開きましょう（ステップ4の手順）

**再起動が必要な理由：** 再起動により、WindowsはインストールされたばかりのWSLと仮想マシンプラットフォーム機能を有効にできます。再起動しないと、WSLは正しく動作しません。

**注意：** コマンドが認識されないというエラーが表示された場合、Windowsのバージョンが古すぎる可能性があります。Windows 10バージョン2004以降、またはWindows 11であることを確認してください。Windows Updateを実行して最新バージョンを取得してください。

## ステップ4：Ubuntuのセットアップ（初回のみ）

コンピュータの再起動後、2〜5分以内に「Ubuntu」というタイトルのターミナルウィンドウが自動的に開くはずです。

**Ubuntuウィンドウが自動的に開かなかった場合：**
- **Windowsスタートボタン**をクリック
- 検索ボックスに`Ubuntu`と入力
- **Ubuntu**をクリック（オレンジ色の丸いアイコンが表示されます）
- Ubuntuターミナルが開き、セットアップが続行されます

**初回セットアップを完了：**

- `Enter new UNIX username:`というメッセージを待ちます
- ユーザー名を入力（小文字とーのみ、スペースなし）
   - 例：`myname`または`john123`
- `New password:`と表示されます
- パスワードを入力（入力中は文字が表示されません - セキュリティのため正常です）
- `Retype new password:`と表示されます
- 同じパスワードをもう一度入力
- セットアップが完了するのを待ちます - `Installation successful!`のようなメッセージが表示されます

**重要：** このユーザー名とパスワードを覚えておいてください - 後で必要になります。

## ステップ5：Ubuntuを更新

- Ubuntuターミナルウィンドウで以下を入力：
   ```
   sudo apt update
   ```
- プロンプトが表示されたら、パスワード（作成したもの）を入力
   - 再度、入力中は文字が表示されません
- 更新が完了するまで待ちます（1〜3分）
- 次に、以下を入力：
   ```
   sudo apt upgrade -y
   ```
- すべてのパッケージがアップグレードされるまで待ちます（5〜10分かかる場合があります）

## ステップ6：Node.jsをインストール

Claude CodeにはNode.jsバージョン18以上が必要です。以下の手順に従ってください：

- Ubuntuターミナルで、以下のコマンドを1つずつ入力：

   まず、nvmインストーラーをダウンロード：
   ```
   wget https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh --no-check-certificate
   ```

   次にインストーラーを実行：
   ```
   cat install.sh | bash
   ```

- nvmを読み込むために以下を入力：
   ```
   \. "$HOME/.nvm/nvm.sh"
   ```

- Node.jsバージョン24をインストール：
   ```
   nvm install 24
   ```
- Node.jsがインストールされるまで待ちます（2〜5分）
- インストールを確認：
   ```
   node --version
   ```
- `v24.x.x`のような表示が見えるはずです（正確な数字は異なる場合があります）

## ステップ7：Claude Codeをインストール

- Ubuntuターミナルで以下を入力：
   ```
   curl -fsSL https://claude.ai/install.sh | bash
   ```
- Claude Codeがインストールされるまで待ちます（2〜5分）
- 黄色や赤色のテキストで警告が表示されることがありますが、通常は正常です
- インストールが完了したら、以下を入力して確認：
   ```
   claude --version
   ```
- Claude Codeのバージョン番号が表示されるはずです

## ステップ8：Anthropic APIとリンク

### オプションA. Claude ProまたはMaxサブスクリプションを使用

- Ubuntuターミナルで以下を入力：
   ```
   claude
   ```
- Claudeがブラウザを開こうとします。自動的に開かない場合は、**Ctrl**を押しながら長いURLをクリックしてブラウザで開きます。または、URLをコピーして外部ブラウザに貼り付けます。
- Claude.aiアカウントにログイン（Chromeを使用している場合、自動的に行われることがあります）
- **認証**をクリック
- 長いコードが表示されたら**コードをコピー**をクリック
- ターミナルウィンドウに戻る
- ターミナルに貼り付けるには：**右クリック**して**貼り付け**を選択（または**Ctrl+Shift+V**を押す）
- 成功メッセージが表示されるはずです
- 指示に従ってセットアップを完了

### オプションB. Anthropic APIキーを使用

Claudeサブスクリプションの代わりにAnthropic APIキーがある場合：

- まず、[Anthropicコンソール](https://console.anthropic.com/)からAPIキーを取得
- Ubuntuターミナルで以下を入力：
   ```
   export ANTHROPIC_API_KEY="your-api-key-here"
   ```
   `your-api-key-here`を実際のAPIキーに置き換えてください
- これを永続的にする（毎回設定しなくて済むように）には、シェルプロファイルに追加：
   ```
   echo 'export ANTHROPIC_API_KEY="your-api-key-here"' >> ~/.bashrc
   ```
   `your-api-key-here`を実際のAPIキーに置き換えてください
- 変更を有効にするには、Ubuntuターミナルを閉じて再度開く
- これでAPIキーでClaude Codeを使用できるはずです

**重要：** Claude ProまたはMaxサブスクリプションがある場合、ANTHROPIC_API_KEY環境変数を設定しないでください。サブスクリプションの使用量を使用し、予期しないAPI料金を避けるために、未設定のままにしてください。

### オプションC. Azure経由でAnthropic APIを使用

ターミナルウィンドウで、環境変数を定義するために以下のコードを貼り付けます：
```
# Microsoft Foundry統合を有効化
export CLAUDE_CODE_USE_FOUNDRY=1
# Azureリソース名
export ANTHROPIC_FOUNDRY_RESOURCE=xxx-eastus2
# モデルをリソースのデプロイメント名に設定
export ANTHROPIC_DEFAULT_OPUS_MODEL=claude-opus-4-5
export ANTHROPIC_DEFAULT_SONNET_MODEL=claude-sonnet-4-5
export ANTHROPIC_FOUNDRY_API_KEY=AqJqe
```

これでAzureにデプロイされたClaudeモデルでClaude Codeを使用できるはずです。

**注意：** 上記のAPIキーは不完全です。Azureポータルから完全なAPIキーを取得する必要があります。

## ステップ9：Claude Codeを使い始める

準備完了です！Claude Codeの使い方：

- Ubuntuターミナルで以下を入力：
   ```
   claude
   ```
- これでClaudeとチャットできます！
- 動作を確認するには、「量子コンピューティングについて説明してください」などの一般的な質問をしてみてください。

## ステップ10：プロジェクトに移動
- Windowsフォルダにプロジェクトがある場合、アクセスできます：
   ```
   cd /mnt/c/Users/Username/Documents/YourProject
   ```
   `Username`を実際のWindowsユーザー名に置き換えてください
- その後、Claudeを起動：
   ```
   claude
   ```
- まずClaudeにコードベースを説明してもらうことから始めましょう。
- Claudeに変更を依頼できます。
- お好みのIDEでコードをテストしてください。

## 再びUbuntuターミナルを開く方法

ターミナルを閉じた後、再び開く方法：

- **Windowsスタートボタン**をクリック
- 検索ボックスに`Ubuntu`と入力
- **Ubuntu**をクリック（オレンジ色の丸いアイコンが表示されます）
- Ubuntuターミナルが開きます

## トラブルシューティング

### 「Please enable the Virtual Machine Platform Windows feature and ensure virtualization is enabled in the BIOS」
このエラーは仮想化が有効になっていないことを意味します：
- ステップ1に戻り、タスクマネージャーで仮想化が有効か確認
- 無効の場合、コンピュータのBIOSで有効にする必要があります（ステップ1の手順を参照）
- 仮想化を有効にした後、コンピュータを再起動して`wsl --install`を再度試してください

### 「wsl --install」が動作しない
- 管理者としてPowerShellを実行していることを確認
- Windows 10バージョン2004以降、またはWindows 11であることを確認
- まず`wsl --update`を実行してから、`wsl --install`を再度試してください

### 再起動後にUbuntuウィンドウが開かない
- Windowsスタートをクリック
- `Ubuntu`と入力
- Ubuntuアプリをクリックして手動で起動

### 「sudo: apt: command not found」
- WSLが正しくインストールされていない可能性があります
- PowerShell（管理者として）で`wsl --unregister Ubuntu`と入力
- その後、`wsl --install`を再度実行

### Node.jsのインストールが失敗
- 最初に`sudo apt update`を実行したことを確認
- インストールコマンドを再度試してください

### Claude Codeコマンドが見つからない
- インストールが正常に完了したことを確認
- Ubuntuターミナルを閉じて再度開いてみてください
- インストールコマンドを再度実行してみてください：`curl -fsSL https://claude.ai/install.sh | bash`

## ヘルプが必要ですか？

- WSLの問題について：[Microsoft WSLドキュメント](https://docs.microsoft.com/en-us/windows/wsl/)
- Claude Codeの問題について：[Claude Code GitHub](https://github.com/anthropics/claude-code)
