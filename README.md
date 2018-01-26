# Name
Book Bookmark App

Description
気になった本を登録し、一覧で表示させるツール

## Demo

## Requirements
データベース：gs_db
テーブル：gs_an_table
テーブル構造
  #1 名前：no(PRIMARY) データ型：int(4)      その他：AUTO_INCREMENT
  #2 名前：id          データ型：varchar(12) 照合順序:utf_unicode_ci
  #3 名前：title       データ型：varchar(96) 照合順序:utf_unicode_ci
  #4 名前：url         データ型：text        照合順序:utf_unicode_ci
  #5 名前：comment     データ型：text        照合順序:utf_unicode_ci
  #6 名前：regiDate    データ型：datetime    照合順序:utf_unicode_ci

## Installation

## Usage
①input_data.phpで本を検索　→　気になる本を「保存」ボタンをクリックするとデータがinsert_data.phpに渡される
②insert_data.phpでデータベースに本の情報を登録
③output_data.phpで登録した本の情報を表示

## Contributing

## License

## Author
MT

※以下社内リポジトリの場合
## Documents

## Issues

## Environments

### Test

### Deploy
