# FURIMA

フリマアプリのクローンサイトです。  
プログラミングスクールTechCampの最終課題としてアジャイル開発を用いて作成いたしました。

## APP URL

http://3.114.22.102/

●Basic認証  
ID：s77teamcfurima  
Pass：s77teamcfurima  
  
【テスト用アカウント】  
● 購入者用  
メールアドレス：test2@test  
パスワード：11111111  


●購入用カード情報  
番号：3530111333300000  
期限：05 / 25  
セキュリティカード：123  


●出品者用  
メールアドレス：test@test  
パスワード：11111111  

## Image

<img width="1438" alt="スクリーンショット 2020-07-12 9 49 47" src="https://user-images.githubusercontent.com/64174311/87245792-4ffd9480-c483-11ea-9ac8-46323e590c05.png">

## Function

ユーザー登録  
ログイン機能  
商品出品/編集/削除  
商品購入  
クレジットカード登録機能

## ER図

<img width="637" alt="スクリーンショット 2020-07-12 20 40 09" src="https://user-images.githubusercontent.com/64174311/87245760-07de7200-c483-11ea-9497-e4cb63ba8205.png">


## データベース設計
## Usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
### Association
- has_many :items, dependent: :destroy
- has_one :profile, dependent: :destroy
- has_one :send_address, dependent: :destroy
- has_one :credits

## Profilesテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|year_birth|date|null: false|
|month_birth|date|null: false|
|day_birth|date|null: false|
|image|text||
|introduction|text||
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## Send_addressesテーブル
|Column|Type|Options|
|------|----|-------|
|send_full_name|string|null: false|
|send_name_kana|string|null: false|
|post_number|string|null: false|
|prefectures|string|null: false|
|city|string|null: false|
|address|string|null: false|
|apartment|string||
|tel_number|integer|null: false, unique: true|
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## Itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|introduce|string|null: false|
|status|integer|null: false|
|shipping_fee|integer|null: false|
|sipping_area|string|null: false|
|date|date|null: false|
|price_introduce|string||
|user|references|null: false, foreign_key: true|
|category|references|null: false, foreign_key: true|
|brand|references|null: false, foreign_key: true|
### Association
- has_many :images, dependent: :destroy
- belongs_to :user
- belongs_to :category
- belongs_to :brand

## Imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item|references|null: false, foreign_key: true|
|image|string|null: false|
### Association
-belongs_to :item

## Categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null, false|
|ancestry|string||
### Association
- has_many :items

## Brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null, false|
### Association
- has_many :items

## Creditsテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null:false, unique: true|
|expiration_year|integer|null:false|
|expiration_month|integer|null:false|
|security_code|integer|null:false|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user
