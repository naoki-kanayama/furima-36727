#　テーブル設計

## usersテーブル

| Column             | Type   | Options     |
|--------------------|--------|-------------|
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted-password | string | null: false |
| user_name          | string | null: false |
| birthday           | date   | null: false |

### Association
- has_many :items
- has_many :records


## itemsテーブル

| Column    | Type       | Options           |
|-----------|------------|-------------------|
| item_name | string     | null: false       |
| category  | string     | null: false       |
| status    | string     | null: false       |
| price     | integer    | null: false       |
| user      | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :record

## recordsテーブル

| Column | Type       | Options           |
|--------|------------|-------------------|
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :destination

## destinationsテーブル

| Column         | Type    | Options     |
|----------------|---------|-------------|
| address        | text    | null: false |
| address_number | integer | null: false |

### Association

- has_many :records