# テーブル設計

## users テーブル

| Column           | Type   | Options     | 
|----------------- | ------ | ----------- |   
| name             | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| birth_day        | string | null: false |

## Association
has_many :buyer
has_many :product

## product テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ | 
| image       | string     | null: false                    |
| name        | string     | null: false                    |
| description | text       | null: false                    |
| category    | string     | null: false                    |
| status      | string     | null: false                    |
| cost        | string     | null: false                    |
| zone        | string     | null: false                    |
| days        | string     | null: false                    |
| price       | integer    | null: false                    |

## Association
has_many :users

## buyer テーブル

| Column       | Type        | Options                        |
| ------------ | ----------- | ------------------------------ |
| post_code    | integer     | null: false                    |
| prefecture   | references  | null: false, foreign_key: true |
| city         | string      | null: false                    |
| adress       | string      | null: false                    |
| building     | string      |                                |
| phone_number | integer     | null: false                    |
| user_id      | references  | null: false, foreign_key: true |
| brand_id     | references  | null: false, foreign_key: true |

## Association
has_many :users