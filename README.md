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
| Column             | Type       | Oputions          | 
| ------------------ | ---------- | ----------------- | 
| name               | string     | null: false       | 
| text               | text       | null: false       | 
| category_id        | integer    | null: false       | 
| status_id          | integer    | null: false       | 
| shipping_charge_id | integer    | null: false       | 
| shipping_area_id   | integer    | null: false       | 
| shipping_days_id   | integer    | null: false       | 
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
has_one :shipping
belongs_to :user


### shippings（配送先情報)
| Column        | Type       | Options           | 
| ------------- | ---------- | ----------------- | 
| postal_code   | string     | null: false       | 
| prefecturs_id | integer    | null: false       | 
| city          | string     | null: false       | 
| home_number   | string     | null: false       | 
| bilding       | string     |                   | 
| tel           | string     | null: false       | 
| purchase      | references | foreign_key: true | 

### Association
belongs_to :purchase

### comments
| Column  | Type       | Options| 
| ------- | ---------- | ------ | 
| comment | string     |        | 
| item    | reference  |        | 
| user    | references |        | 

### Association
belongs_to :user
belongs_to :item