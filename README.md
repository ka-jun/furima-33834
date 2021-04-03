# README

### users
| Column                | Type   | Options     | 
| --------------------- | ------ | ----------- | 
| nickname              | string | null: false | 
| email                 | string | null: false | 
| password              | string | null: false | 
| password-confirmation | string | null: false | 
| birth-year            | string | null: false | 
| birth-month           | string | null: false | 
| birth-day             | string | null: false | 
| last-name             | string | null: false | 
| first-name            | string | null: false | 
| last-name-kana        | string | null: false | 
| first-name-kana       | string | null: false | 

### Association
has_many :items
has_many ;comments


### items
| Column          | Type          | Opution     | 
| --------------- | ------------- | ----------- | 
| item-image      | ActiveStorage | null: false | 
| item-name       | string        | null: false | 
| item-text       | text          | null: false | 
| item-category   | string        | null: false | 
| item-status     | string        | null: false | 
| shipping-charge | string        | null: false | 
| shipping-area   | string        | null: false | 
| shipping-days   | string        | null: false | 
| item-price      | string        | null: false | 
| user            | reference     |             | 

### Association
belongs_to :user
has_one :purchase
has_one :shipping
has_many :comments


### purchase(購入情報) 
| Column         | Type      | Option      | 
| -------------- | --------- | ----------- | 
| card-number    | string    | null: false | 
| card-exp-year  | string    | null: false | 
| card-exp-month | string    | null: false | 
| security-code  | string    | null: false | 
| item           | reference |             | 
### Association
belong_to :item


### shipping（配送先情報)
| Column      | Type      | Option      | 
| ----------- | --------- | ----------- | 
| postal-code | string    | null: false | 
| prefecturs  | string    | null: false | 
| city        | string    | null: false | 
| bilding     | string    |             | 
| tel         | string    | null: false | 
| item        | reference |             | 

### Association
belong_to :item

### comments
| Column  | Type       | Option | 
| ------- | ---------- | ------ | 
| comment | string     |        | 
| item    | reference  |        | 
| user    | references |        | 

### Association
belongs_to :user
belongs_to :item