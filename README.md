# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string   | null: false |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false |
| first_name         | string   | null: false |
| last_name          | string   | null: false |
| first_name_kana    | string   | null: false |
| last_name_kana     | string   | null: false |
| birth_day          | date     | null: false |

### Association
- has_many :items
- has_many :orders


## items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| item_name          | string     | null: false |
| description        | text       | null: false |
| category_id        | integer    | null: false |
| item_condition_id  | integer    | null: false |
| shipping_charge_id | integer    | null: false |
| prefecture_id      | integer    | null: false |
| shipping_date_id   | integer    | null: false |
| price              | integer    | null: false |
| user               | references | null: false, foreign_key: true |
<!--user 出品者 -->
### Association
- belongs_to :user
- has_one :order



## orders テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |
<!-- user 購入した人　item購入したもの -->
### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping

## shippings テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| postal_code        | string     | null: false |
| prefecture_id      | integer    | null: false |
| city               | string     | null: false |
| street_address     | string     | null: false |
| building_name      | string     |             |
| phone_number       | string     | null: false |
| order              | references | null: false, foreign_key: true |

### Association

- belongs_to :order
