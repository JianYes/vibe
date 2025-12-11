[ホーム](./)

# VS CodeでPythonコーディング

Pythonコードを書きたいけど、どのエディターを使うか迷っている、またはPyCharmより軽いものを探している。VS CodeはスイスアーミーナイフのようなもYouの - Python、R、JavaScript、その他多くの言語を1つの軽量エディターで扱えます。このチュートリアルでは、コード補完、対話型デバッグ、さらにはWebアプリまで、VS CodeでPythonをセットアップする方法を紹介します。

## 主要な概念

- **[Python拡張機能](https://marketplace.visualstudio.com/items?itemName=ms-python.python)** - シンタックスハイライト、デバッグ、コード実行、Jupyterノートブックサポートを提供するMicrosoftのVS Code拡張機能
- **[Pylance](https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance)** - Python用の高速IntelliSense、型チェック、自動インポートを可能にする言語サーバー
- **[仮想環境](https://docs.python.org/3/library/venv.html)** - システムPythonに影響を与えずにプロジェクト固有のパッケージを管理するための隔離されたPython環境
- **[Streamlit](https://streamlit.io/)** - シンプルなPythonスクリプトで対話型Webアプリを作成するためのPythonライブラリ

## 必要なもの

- [VS Codeの基本](./VS_Code_Getting_Started)を完了
- Pythonとパッケージをダウンロードするためのインターネット接続
- 15〜20分

## ステップ1：Pythonをインストール

モダンなパッケージとの最高の互換性のためにPython 3.8以上が必要です。

- **Windows**：
  - [python.org](https://www.python.org/downloads/)から最新のPythonをダウンロード
  - インストーラーを実行
  - Install Nowをクリックする前に**「Add python.exe to PATH」にチェック**
  - インストール場所をメモ（通常は`C:\Users\YourName\AppData\Local\Programs\Python\Python312`）

- **macOS**：
  - [python.org](https://www.python.org/downloads/)からダウンロードしてインストーラーを実行
  - またはHomebrewを使用：ターミナルを開いて`brew install python`と入力
  - Homebrewパス：`/opt/homebrew/bin/python3`（Apple Silicon）または`/usr/local/bin/python3`（Intel）

- **Linux**：
  - Pythonは通常プリインストールされています。`python3 --version`でバージョンを確認
  - 必要に応じてパッケージマネージャーでインストール：`sudo apt install python3 python3-pip python3-venv`（Ubuntu/Debian）

ターミナルを開いて`python3 --version`または`python --version`と入力してインストールを確認。

## ステップ2：VS CodeにPython拡張機能をインストール

- VS Codeを開く
- 左サイドバーの**拡張機能**アイコンをクリック（またはWindows/Linuxで`Ctrl+Shift+X`、Macで`Cmd+Shift+X`を押す）
- `ms-python.python`を検索し、MicrosoftのPython拡張機能で**インストール**をクリック
- PylanceはPython拡張機能と一緒に自動的にインストールされるはずです。そうでない場合は`ms-python.vscode-pylance`を検索してインストール

Python拡張機能にはデバッグ、IntelliSense、コードフォーマット、Jupyterノートブックのサポートが含まれています。

## ステップ3：Pythonプロジェクトを作成

- コンピュータに新しいフォルダを作成（例：`my-python-project`）
- VS Codeで**ファイル > フォルダーを開く**をクリックし、新しいフォルダを選択
- トップメニューで**ファイル > 新規ファイル**をクリック
- **ファイル > 保存**をクリックして`analysis.py`として保存

## ステップ4：Pythonインタープリターを選択

VS Codeはどのpythonインストールを使用するか知る必要があります。

- `Ctrl+Shift+P`（Windows/Linux）または`Cmd+Shift+P`（Mac）を押してコマンドパレットを開く
- `Python: Select Interpreter`と入力して選択
- インストールしたPythonバージョンを選択（例：`Python 3.12.x`など）
- 選択したインタープリターがVS Codeの右下隅に表示されます

Pythonインストールが表示されない場合は、**Enter interpreter path**をクリックしてPythonがインストールされている場所に移動してください。

## ステップ5：仮想環境を作成

仮想環境はプロジェクトの依存関係を隔離します。

- `Ctrl+Shift+P`（Windows/Linux）または`Cmd+Shift+P`（Mac）を押す
- `Python: Create Environment`と入力して選択
- **Venv**（組み込み仮想環境）を選択
- リストからPythonインタープリターを選択
- VS Codeが環境を作成するまで待つ（`.venv`フォルダが表示されます）
- VS Codeはプロジェクトでこの環境を自動的にアクティブにします

環境がアクティブな場合、ターミナルプロンプトに`(.venv)`が表示されます。

## ステップ6：必要なパッケージをインストール

- **表示 > ターミナル**をクリックしてVS Codeで新しいターミナルを開く
- ターミナルに`(.venv)`が表示され、仮想環境がアクティブであることを示すはずです
- これらのコマンドを入力してパッケージをインストール：

```bash
pip install pandas matplotlib streamlit
```

- インストールが完了するまで待つ（1〜2分かかる場合があります）

`(.venv)`が表示されない場合、環境がアクティブになっていません。`Ctrl+Shift+P`を押して`Python: Select Interpreter`を実行し、横に`('.venv': venv)`があるインタープリターを選択してください。

## ステップ7：最初のPythonスクリプトを書く

`analysis.py`に以下のコードを入力：

```python
import pandas as pd
import matplotlib.pyplot as plt

# irisデータセットを読み込み
url = "https://raw.githubusercontent.com/mwaskom/seaborn-data/master/iris.csv"
iris = pd.read_csv(url)

# 最初の数行を表示
print(iris.head())

# 要約統計を生成
print("\n要約統計:")
print(iris.describe())

# ヒストグラムを作成
plt.figure(figsize=(8, 6))
plt.hist(iris['sepal_length'], bins=20, color='steelblue', edgecolor='white')
plt.xlabel('がく片の長さ (cm)')
plt.ylabel('頻度')
plt.title('がく片の長さの分布')
plt.show()
```

- **ファイル > 保存**をクリックしてファイルを保存

## ステップ8：Pythonコードを対話的に実行

- `analysis.py`を開いた状態で、右上の**▶ Run Python File**ボタンをクリック
- または、エディターで右クリックして**Run Python File in Terminal**を選択
- ターミナルパネルに出力が表示されるのを見る
- プロットを表示するヒストグラムウィンドウがポップアップします
- 特定の行を選択して`Shift+Enter`を押すと、対話型Pythonセッションでその行だけを実行することもできます

## ステップ9：シンプルなStreamlitアプリを作成

- 新しいファイルを作成：**ファイル > 新規ファイル**
- `app.py`として保存
- 以下のコードを入力：

```python
import streamlit as st
import pandas as pd
import matplotlib.pyplot as plt

st.title("対話型ヒストグラム")

# サイドバースライダー
bins = st.sidebar.slider(
    "ビンの数:",
    min_value=5,
    max_value=50,
    value=30
)

# データを読み込み
url = "https://raw.githubusercontent.com/mwaskom/seaborn-data/master/iris.csv"
iris = pd.read_csv(url)

# ヒストグラムを作成
fig, ax = plt.subplots(figsize=(8, 6))
ax.hist(iris['sepal_length'], bins=bins, color='steelblue', edgecolor='white')
ax.set_xlabel('がく片の長さ (cm)')
ax.set_ylabel('頻度')
ax.set_title('がく片の長さの分布')

# Streamlitで表示
st.pyplot(fig)
```

- ファイルを保存
- ターミナルを開いて実行：

```bash
streamlit run app.py
```

- アプリがブラウザで開きます（通常は`http://localhost:8501`）
- サイドバーでスライダーを動かすとヒストグラムが即座に更新されます
- `Ctrl+C`をターミナルで押すとアプリを停止

## ステップ10：コード補完とIntelliSenseを使用

- `analysis.py`で、新しい行に`iris.`と入力し始める
- 利用可能なすべてのメソッドと属性を含むドロップダウンが表示されます
- `iris.gr`と入力すると`groupby()`が提案されます
- 既存コードの`pd.read_csv`の上にマウスを置く
- ポップアップに関数のシグネチャ、パラメータ、ドキュメントが表示されます
- `import `と入力するとVS Codeがパッケージ名を提案します
- 関数呼び出しを入力すると、IntelliSenseがパラメータのヒントを表示します

## ステップ11：デバッグを試す

- `analysis.py`で、行番号8（`print(iris.head())`の行）の左をクリックしてブレークポイントを設定（赤い点が表示されます）
- `F5`を押すか、**実行 > デバッグの開始**をクリック
- プロンプトが表示されたら**Python File**を選択
- コード実行がブレークポイントで一時停止します
- デバッグツールバーを使用してコードをステップ実行し、変数を検査し、コールスタックを確認
- `F5`を再度押して実行を続行

## 次のステップ

- データ操作と分析のために[pandas](https://pandas.pydata.org/)を探索
- 対話型データサイエンスのためにVS Codeで[Jupyterノートブック](https://code.visualstudio.com/docs/datascience/jupyter-notebooks)を学ぶ
- Web APIを構築するために[Flask](https://flask.palletsprojects.com/)や[FastAPI](https://fastapi.tiangolo.com/)を試す
- 自動コードフォーマットのために[Black](https://marketplace.visualstudio.com/items?itemName=ms-python.black-formatter)をインストール
- テストの作成と実行のために[pytest](https://docs.pytest.org/)を使用

## トラブルシューティング

- **ターミナルで「Python is not recognized」**：PythonがシステムPATHにありません。Windowsでは、Pythonを再インストールして「Add python.exe to PATH」にチェックしてください。Mac/Linuxでは、`python`の代わりに`python3`を使用してください。修正後にVS Codeを再起動。

- **インタープリターが見つからない**：VS Codeの右下隅にあるインタープリターセレクターをクリックするか、`Ctrl+Shift+P`を押して`Python: Select Interpreter`を実行してください。Pythonインストールが表示されない場合は、**Enter interpreter path**を選択してPython実行ファイルを参照してください。

- **仮想環境がアクティブにならない**：VS Codeはターミナルを開くと自動的にアクティブにするはずです。そうでない場合は、手動でアクティブにしてください：Windows: `.venv\Scripts\activate`、Mac/Linux: `source .venv/bin/activate`。ターミナルプロンプトに`(.venv)`が表示されることを確認してください。

- **IntelliSenseが動作しない**：Pylanceがインストールされ有効になっていることを確認してください。右下隅に選択したインタープリターが表示されていることを確認してください。ファイルを開いた後、Pylanceが初期化されるまで10〜20秒待ってください。問題が続く場合はVS Codeを再起動してください。

- **pip installが失敗**：仮想環境がアクティブであることを確認してください（ターミナルに`(.venv)`を探す）。Linuxでは、最初に`python3-venv`をインストールする必要があるかもしれません。Windowsでは、アンチウイルスがpipをブロックしていないか確認してください。

- **Streamlitアプリが実行されない**：仮想環境にstreamlitがインストールされていることを確認してください（`pip list | grep streamlit`）。ターミナルでエラーメッセージを確認してください。ポート8501を使用している他のアプリがないことを確認してください。

## ワークフロー概要

VS Codeは以下の利点を持つモダンで軽量なPython開発環境を提供します：

- **統一環境**：1つのエディターでPython、R、JavaScriptなどをコーディング
- **強力なIntelliSense**：Pylanceによるスマートな補完、型チェック、自動インポート
- **統合デバッグ**：ブレークポイントを設定し、変数を検査し、コードをステップ実行
- **Jupyterサポート**：別のアプリケーションなしでVS Codeで直接ノートブックを実行
- **バージョン管理**：変更を追跡するためのGit統合
- **拡張機能エコシステム**：テスト、フォーマット、リンティングなど何千もの拡張機能

---

[Steven Ge](https://www.linkedin.com/in/steven-ge-ab016947/)が2025年12月7日に作成。

[その他のチュートリアル](https://github.com/gexijin/vibe)
