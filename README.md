# README

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association

- has_many :likes
- has_many :matchings
- has_many :contacts
- has_many :reservations
- has_one  :address



## users_addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user



## conservation_groups テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association

- has_many :animals
- has_one  :address



## conservation_groups_addresses テーブル

| Column                  | Type       | Options                        |
| ----------------------- | ---------- | ------------------------------ |
| postal_code             | string     | null: false                    |
| prefecture_id           | integer    | null: false                    |
| city                    | string     | null: false                    |
| address                 | string     | null: false                    |
| building                | string     |                                |
| phone_number            | string     | null: false                    |
| conservation_group_user | references | null: false, foreign_key: true |

### Association

- belongs_to :conversation_group



## animals テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| age                | integer    | null: false                    |
| birth_date         | integer    | null: false                    |
| animal_category_id | integer    | null: false                    |
| personality        | text       | null: false                    |
| size_id            | integer    | null: false                    |
| sex_id             | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| conversation_group | references | null: false, foreign_key: true |

### Association

- has_many :likes
- has_many :animal_tags
- has_many :tags, through: animal_tags
- has_one  :matching
- has_one  :contact
- has_one  :reservation



## tags テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| kind_name | string     | null: false                    |

### Association

- has_many :animal_tags
- has_many :animals, through: animal_tags



## animal_tags テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| animal | references | null: false, foreign_key: true |
| tag    | references | null: false, foreign_key: true |

### Association

- belongs_to :animal
- belongs_to :tag



## contacts テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| email        | string     | null: false                    |
| phone_number | string     | null: false                    |
| message      | text       | null: false                    |
| animal       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :animal


## reservations テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| email         | string     | null: false                    |
| phone_number  | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| date          | date       | null: false                    |
| message       | text       | null: false                    |
| animal        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :animal



## likes テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| animal | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :animal



## matching テーブル


| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| animal | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :animal