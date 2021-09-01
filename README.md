#　テーブル設計

## usersテーブル

| Column             | Type   | Options     |
|--------------------|--------|-------------|
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted-password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |

### Association
- has_many :items
- has_many :records


## itemsテーブル

| Column        | Type       | Options           |
|---------------|------------|-------------------|
| item_name     | string     | null: false       |
| category      | integer    | null: false       |
| status        | integer    | null: false       |
| price         | integer    | null: false       |
| user          | references | foreign_key: true |
| text          | text       | null: false       |
| shipping_date | date       | null: false       |
| prefecture    | integer    | null: false       |


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
- belongs_to :destination

## destinationsテーブル

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| prefecture      | integer    | null: false                    |
| city            | string     | null: false                    |
| address         | string     | null: false                    |
| building_number | string     | null: false                    |
| address_number  | integer    | null: false                    |
| tel_number      | integer    | null: false                    |
| record          | references | foreign_key: true, null: false |

### Association

- has_one :record