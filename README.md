# README

### users
| Column             | Type   | Options           | 
| ------------------ | ------ | ----------------- | 
| nickname           | string | null: false       | 
| email              | string | foreign_key: true | 
| encrypted_password | string | null: false       | 
| birthday           | date   | null: false       | 
| last-name          | string | null: false       | 
| first-name         | string | null: false       | 
| last-name-kana     | string | null: false       | 
| first-name-kana    | string | null: false       | 

### Association
has_many :items
has_many :comments
has_many :purchases


### items
| Column             | Type       | Opution           | 
| ------------------ | ---------- | ----------------- | 
| name               | string     | null: false       | 
| text               | text       | null: false       | 
| category_id        | integer    | null: false       | 
| status_id          | integer    | null: false       | 
| shipping-charge_id | integer    | null: false       | 
| shipping-area_id   | integer    | null: false       | 
| shipping-days_id   | integer    | null: false       | 
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
| user     | reference  | foreign_key: true | 

### Association
belongs_to :item
has_one :shipping
belongs_to :user


### shippings（配送先情報)
| Column        | Type       | Option            | 
| ------------- | ---------- | ----------------- | 
| postal-code   | string     | null: false       | 
| prefecturs_id | integer    | null: false       | 
| city          | string     | null: false       | 
| home-number   | string     | null: false       | 
| bilding       | string     |                   | 
| tel           | string     | null: false       | 
| purchase      | references | foreign_key: true | 

### Association
belongs_to :purchase

### comments
| Column  | Type       | Option | 
| ------- | ---------- | ------ | 
| comment | string     |        | 
| item    | reference  |        | 
| user    | references |        | 

### Association
belongs_to :user
belongs_to :item