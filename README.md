# latexmk + textlint on VS Code Remote

VS Code Remote Developmentを用いたlatexmk＋textlint環境

## 環境

* [Docker](https://www.docker.com/)
* [Visual Studio Code](https://code.visualstudio.com/)（2019/07/28現在、Alpineの利用には[Insiders版](https://code.visualstudio.com/insiders/)が必要）
  * [Remote Development](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)

## 使い方

1. このリポジトリをクローンする
2. VS Code Remote Containerでフォルダーを開く
3. `.tex`, `.sty`, `.bib`ファイル等を配置する
4. `.tex`ファイルを開き、タブでプレビューを開く

## 備考

* platexを利用しているのは、ipsjのテンプレートがplatexであるため
* 2019/07/28現在、Remote上のPDFのプレビューができない
  * [#77281](https://github.com/microsoft/vscode/issues/77281)で修正する予定らしい
