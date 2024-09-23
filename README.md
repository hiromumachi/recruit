<div align="center">
	<img src="assets/image/logo.svg" width="200" height="200" style="border-radius: 25px; box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.3);" >
</div>

# Getting Started

## Setup

[Flutter](https://qiita.com/mkurom/items/bd0e2ae45d7afb5e02ec)をインストールする

asdfを使用しています。[.tool-versions](.tool-versions)に使用しているFlutterのVersion記載があります。

## Run

### 事前設定
ConstInfoにPCのIPアドレスを記載してください( 3000 はサーバーのポート番号に合わせる)  
[const_info.dart](./lib/constant/const_info.dart)  

例 http://10.0.2.2:3000  

### Freezed 更新
- `flutter pub run build_runner build --delete-conflicting-outputs`

### Assets 更新
[flutter_gen](https://pub.dev/packages/flutter_gen)を使用しています。
- `fluttergen -c ./pubspec.yaml`

### dev環境
- `flutter run --debug`

### product環境
- `flutter run --release`


## コメント
いただいたデザインを確認しましたが、スマートフォンアプリでは見栄えが悪くなってしまったので、割合などを見つつ修正しました。    
横画面と縦画面でレイアウトを変えました。  
横画面はいただいたレイアウトに近づくようにしました。  
縦画面はサイドバーをハンバーガーメニューに入れてコンテンツの編集をしやすいようにしました。  

androidは実機,iosはエミュレータで確認しました。

## ディレクトリ構成
Clean Architectureを意識しています。  


constant アプリ全体で使用する情報  
data 外部との通信(今回はapi)  
gen assetsとfontを変数化したもの(自動生成)  
model freezedクラスや例外など  
provider アプリ内で共有するProvider  
util アプリ内で共有するログなどのツール  
widget アプリ内ページ  
	-page 各ページ  
		--logic ページ内で監視するロジック  
		--model ページ内で使用するクラスなど  
		--view ページUI  
	-component ページ共通で使えるコンポーネント

<pre> 
.
─ lib
│   ├── constant
│   │   ├── api_option.dart
│   │   ├── const_info.dart
│   │   ├── custom_colors.dart
│   │   ├── custom_texts.dart
│   │   ├── custom_theme_datas.dart
│   │   ├── logger_info.dart
│   │   ├── route.dart
│   │   └── route_name.dart
│   ├── data
│   │   ├── repository
│   │   │   └── api_repository.dart
│   │   └── usecase
│   │       └── content
│   │           └── content_usecase.dart
│   ├── gen
│   │   ├── assets.gen.dart
│   │   └── fonts.gen.dart
│   ├── main.dart
│   ├── main_run_app.dart
│   ├── model
│   │   ├── enum
│   │   │   └── button_status.dart
│   │   ├── exception
│   │   │   └── api_exception.dart
│   │   ├── extension
│   │   │   ├── context_extension.dart
│   │   │   ├── datetime_converter.dart
│   │   │   └── list_extension.dart
│   │   └── freezed
│   │       └── content
│   │           ├── add_content_entity.dart
│   │           ├── add_content_entity.freezed.dart
│   │           ├── add_content_entity.g.dart
│   │           ├── content_entity.dart
│   │           ├── content_entity.freezed.dart
│   │           ├── content_entity.g.dart
│   │           ├── put_content_entity.dart
│   │           ├── put_content_entity.freezed.dart
│   │           └── put_content_entity.g.dart
│   ├── provider
│   │   └── api
│   │       └── api_repository_provider.dart
│   ├── util
│   │   ├── date_util.dart
│   │   ├── dev_log.dart
│   │   ├── easy_loading_util.dart
│   │   ├── error_util.dart
│   │   └── logger_util.dart
│   └── widget
│       ├── component
│       │   ├── button
│       │   │   ├── add_button.dart
│       │   │   ├── cancel_button.dart
│       │   │   ├── delete_button.dart
│       │   │   ├── done_button.dart
│       │   │   ├── edit_button.dart
│       │   │   └── save_button.dart
│       │   ├── textfield
│       │   │   └── custom_text_formfield.dart
│       │   └── title_logo.dart
│       └── page
│           └── main
│               ├── logic
│               │   ├── add_content_provider.dart
│               │   ├── delete_content_provider.dart
│               │   ├── get_all_content_provider.dart
│               │   └── put_content_provider.dart
│               ├── model
│               │   ├── is_edit_provider.dart
│               │   └── select_content_provider.dart
│               └── view
│                   ├── body.dart
│                   ├── content
│                   │   ├── bottom_area.dart
│                   │   └── bottom_edit_area.dart
│                   ├── main_page.dart
│                   └── side_menu.dart

</pre>
