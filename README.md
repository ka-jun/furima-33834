# README

### users
| Column                | Type   | Options     | 
| --------------------- | ------ | ----------- | 
| nickname              | string | null: false | 
| email                 | string | null: false | 
| encrypted_password    | string | null: false | 
| birthday              | date   | null: false | 
| last-name             | string | null: false | 
| first-name            | string | null: false | 
| last-name-kana        | string | null: false | 
| first-name-kana       | string | null: false | 

### Association
has_many :items
has_many ;comments


### items
| Column             | Type      | Opution     | 
| ------------------ | --------- | ----------- | 
| item-name          | string    | null: false | 
| item-text          | text      | null: false | 
| item-category_id   | string    | null: false | 
| item-status_id     | string    | null: false | 
| shipping-charge_id | string    | null: false | 
| shipping-area_id   | string    | null: false | 
| shipping-days_id   | string    | null: false | 
| item-price         | integer   | null: false | 
| user               | reference |             | 

### Association
belongs_to :user
has_one :purchase
has_one :shipping
has_many :comments


### purchase(購入情報) 
| Column  | Type       | Options           | 
| ------- | ---------- | ----------------- | 
| item    | references | foreign_key: true | 
| user    | reference  |                   | 

### Association
belong_to :item
belongs_to :shipping


### shipping（配送先情報)
| Column        | Type      | Option      | 
| ------------- | --------- | ----------- | 
| postal-code   | string    | null: false | 
| prefecturs_id | integer   | null: false | 
| city          | string    | null: false | 
| bilding       | string    |             | 
| tel           | string    | null: false | 
| item          | reference |             | 
| purchase      | reference |             | 

### Association
belong_to :item
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