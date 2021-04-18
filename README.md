# README

### users
| Column             | Type   | Options     | 
| ------------------ | ------ | ----------- | 
| nickname           | string | null: false | 
| email              | string | unique:true | 
| encrypted_password | string | null: false | 
| birthday           | date   | null: false | 
| last_name          | string | null: false | 
| first_name         | string | null: false | 
| last_name_kana     | string | null: false | 
| first_name_kana    | string | null: false | 

### Association
has_many :items
has_many :comments
has_many :purchases


### items
| Column             | Type       | Options           | 
| ------------------ | ---------- | ----------------- | 
| name               | string     | null: false       | 
| text               | text       | null: false       | 
| category_id        | integer    | null: false       | 
| condition_id       | integer    | null: false       | 
| shipping_charge_id | integer    | null: false       | 
| shipping_area_id   | integer    | null: false       | 
| shipping_day_id    | integer    | null: false       | 
| price              | integer    | null: false       | 
| user               | references | foreign_key: true | 

### Association
belongs_to :user
has_one :purchase
has_many :comments


### purchases(購入情報) 
| Column   | Type       | Options           | 
| -------- | ---------- | ----------------- | 
| item     | references | foreign_key: true | 
| user     | references | foreign_key: true | 

### Association
belongs_to :item
has_one :address
belongs_to :user


### addresses（配送先情報)
| Column           | Type       | Option            | 
| ---------------- | ---------- | ----------------- | 
| postal_code      | string     | null: false       | 
| shipping_area_id | integer    | null: false       | 
| city             | string     | null: false       | 
| home_number      | string     | null: false       | 
| building         | string     |                   | 
| tel              | string     | null: false       | 
| item             | references | foreign_key: true | 
| purchase         | references | foreign_key: true | 

### Association
belongs_to :purchase

### comments
| Column  | Type       | Option            | 
| ------- | ---------- | ----------------- | 
| comment | string     |                   | 
| item    | references | foreign_key: true | 
| user    | references | foreign_key: true | 

### Association
belongs_to :user
belongs_to :item
