#　テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
|--------------------|--------|---------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association
- has_many :items
- has_many :records


## itemsテーブル

| Column           | Type       | Options           |
|------------------|------------|-------------------|
| item_name        | string     | null: false       |
| category_id      | integer    | null: false       |
| status_id        | integer    | null: false       |
| price            | integer    | null: false       |
| user             | references | foreign_key: true |
| text             | text       | null: false       |
| shipping_date_id | integer    | null: false       |
| prefecture_id    | integer    | null: false       |
| delivery_fee_id  | integer    | null: false       |


### Association

- belongs_to :user
- has_one :record

## recordsテーブル

| Column | Type       | Options                        |
|--------|------------|--------------------------------|
| user   | references | foreign_key: true, null: false |
| item   | references | foreign_key: true, null: false |

### Association

- belongs_to :user
- belongs_to :item
- has_one :destination

## destinationsテーブル

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| prefecture_id   | integer    | null: false                    |
| city            | string     | null: false                    |
| address         | string     | null: false                    |
| building_number | string     |                                |
| address_number  | string     | null: false                    |
| tel_number      | string     | null: false                    |
| record          | references | foreign_key: true, null: false |

### Association

- belongs_to :record