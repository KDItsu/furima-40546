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
| birth_year         | datetime | null: false |
| birth_month        | datetime | null: false |
| birth_date         | datetime | null: false |

### Association
- has_many :items
- has_many :orders


## items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| seller_name        | string     | null: false |
| item_name          | string     | null: false |
| text               | text       | null: false |
| category           | string     | null: false |
| item_condition     | string     | null: false |
| shipping_charges   | string     | null: false |
| region             | string     | null: false |
| shipping_dates     | datetime   | null: false |
| price              | integer    | null: false |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order



## orders テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| buyer_name         | string     | null: false |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping

## shippings テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| postal_code        | integer    | null: false |
| prefecture         | string     | null: false |
| city               | string     | null: false |
| street_address     | integer    | null: false |
| building_name      | string     | null: false |
| phone_number       | integer    | null: false |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :order
