[ホーム](./)

# VS CodeでPythonを書く

「Pythonを書きたいけど、どのエディターを使えばいい？」「PyCharmは少し重い…」そんなときはVS Code。軽快なのに高機能で、PythonやR、JavaScriptなどを1つのエディターで扱えます。このガイドでは、VS CodeにPython環境を整え、補完やデバッグ、Streamlitアプリまで動かすところを体験します。

## キーワード

- **Python拡張機能**（ms-python.python）: Microsoft公式。構文ハイライト、インテリセンス、デバッグ、Jupyter対応などを提供
- **Pylance**: 高速な言語サーバー。型チェックや自動補完が強化されます
- **仮想環境 (venv)**: プロジェクトごとの依存関係を分離するPythonの仕組み
- **Streamlit**: PythonだけでインタラクティブなWebアプリを作れるライブラリ

## 前提条件

- [VS Codeの基本](./VS_Code_Getting_Started) を読んでインターフェースに慣れていること
- Python/Pipをダウンロードできるインターネット接続
- 作業時間：15〜20分

---

## ステップ1：Python本体をインストール

Python 3.8以降を推奨。

- **Windows**: [python.org](https://www.python.org/downloads/) から`.exe`をダウンロード → 実行 → 「Add python.exe to PATH」に必ずチェック
- **macOS**: python.orgからインストール、または `brew install python`
- **Linux**: 多くは標準で導入済み。`python3 --version` で確認し、必要なら `sudo apt install python3 python3-pip python3-venv`

インストール後、ターミナルで `python3 --version`（または `python --version`）が表示されればOK。

## ステップ2：VS CodeにPython拡張機能を入れる

1. VS Codeで拡張機能ビュー（`Ctrl/Cmd + Shift + X`）を開く
2. `ms-python.python` を検索 → **Install**
3. 同時にPylanceも入るはずですが、入っていなければ `ms-python.vscode-pylance` を検索してインストール

## ステップ3：プロジェクトフォルダを用意

1. `my-python-project` などのフォルダを作成
2. VS Codeで **ファイル > フォルダーを開く** → 作成したフォルダを選択
3. **ファイル > 新規ファイル** で `analysis.py` を保存

## ステップ4：Pythonインタプリタを選択

1. `Ctrl/Cmd + Shift + P` → “Python: Select Interpreter” と入力
2. インストールしたPython（例：`Python 3.11`）を選択
3. 右下ステータスバーに選択したバージョンが表示されます

## ステップ5：仮想環境を作成

1. もう一度 `Ctrl/Cmd + Shift + P`
2. “Python: Create Environment” → **Venv** を選択
3. 先ほど選んだPythonを指定
4. `.venv` フォルダが作られ、ターミナルに `(.venv)` が表示されれば成功

## ステップ6：必要パッケージをインストール

VS Codeのターミナルで以下を実行：
```bash
pip install pandas matplotlib streamlit
```
`(.venv)` が表示されていない場合は、インタプリタを仮想環境に切り替えてください（`Python: Select Interpreter` → `.venv` と書かれているもの）。

## ステップ7：Pythonスクリプトを書く

`analysis.py` に以下を貼り付けて保存します。
```python
import pandas as pd
import matplotlib.pyplot as plt

url = "https://raw.githubusercontent.com/mwaskom/seaborn-data/master/iris.csv"
iris = pd.read_csv(url)

print(iris.head())
print("\nSummary Statistics:")
print(iris.describe())

plt.figure(figsize=(8, 6))
plt.hist(iris['sepal_length'], bins=20, color='steelblue', edgecolor='white')
plt.xlabel('Sepal Length (cm)')
plt.ylabel('Frequency')
plt.title('Distribution of Sepal Length')
plt.show()
```

## ステップ8：コードを実行

- エディター右上の ▶ ボタン、または右クリック → **Run Python File in Terminal**
- ターミナルにデータの先頭行と統計が表示され、別ウィンドウでヒストグラムが開きます
- `Shift + Enter` を使えば選択した行だけ実行することも可能

## ステップ9：Streamlitアプリを作る

1. `app.py` を新規作成し、以下を貼り付け：
```python
import streamlit as st
import pandas as pd
import matplotlib.pyplot as plt

st.title("Interactive Histogram")

bins = st.sidebar.slider("Number of bins:", 5, 50, 30)

url = "https://raw.githubusercontent.com/mwaskom/seaborn-data/master/iris.csv"
iris = pd.read_csv(url)

fig, ax = plt.subplots(figsize=(8, 6))
ax.hist(iris['sepal_length'], bins=bins, color='steelblue', edgecolor='white')
ax.set_xlabel('Sepal Length (cm)')
ax.set_ylabel('Frequency')
ax.set_title('Distribution of Sepal Length')

st.pyplot(fig)
```
2. ターミナルで `streamlit run app.py`
3. ブラウザが `http://localhost:8501` を開き、スライダーを動かすとグラフが更新されます
4. 終了するときはターミナルで `Ctrl + C`

## ステップ10：補完とインテリセンスを体験

- `iris.` と入力すると列名やメソッド候補がポップアップ
- `iris.gr` まで入力すると `groupby()` が提案されます
- `pd.read_csv` にマウスを合わせると、引数情報やドキュメントが表示
- 関数を入力するとパラメータヒントが表示されます

## ステップ11：デバッグを試す

1. `print(iris.head())` の左側をクリックしてブレークポイント（赤丸）を設置
2. `F5`（Run > Start Debugging）を実行
3. **Python File** を選択すると、その行で停止
4. 変数の中身やコールスタックを確認しながらステップ実行できます

---

## 次のステップ

- `pip install seaborn plotly` など別ライブラリも試す
- VS CodeのJupyterノートブック機能（`.ipynb`）を開いて実験する
- GitHub Copilotに「この関数を最適化して」「エラーを直して」と依頼してみる
- [Streamlit](https://streamlit.io/) や [FastAPI](https://fastapi.tiangolo.com/) でWebアプリを拡張する

VS Codeは軽量ながら機能豊富。仮想環境と拡張機能を組み合わせれば、本格的なPython開発も意外と簡単に始められます。まずはこのセットアップをベースに、少しずつ自分のプロジェクトへ広げてみてください。
