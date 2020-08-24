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
has_many :buyers
has_many :products

## products テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ | 
| image       | string     | null: false                    |
| name        | string     | null: false                    |
| description | text       | null: false                    |
| category    | integer    | null: false                    |
| status      | integer    | null: false                    |
| cost        | integer    | null: false                    |
| zone        | integer    | null: false                    |
| days        | integer    | null: false                    |
| price       | integer    | null: false                    |
｜user_id    |

## Association
belongs_to :users

## buyers テーブル

| Column       | Type        | Options                        |
| ------------ | ----------- | ------------------------------ |
| post_code    | integer     | null: false                    |
| prefecture   | integer     | null: false                    |
| city         | string      | null: false                    |
| adress       | string      | null: false                    |
| building     | string      |                                |
| phone_number | integer     | null: false                    |
| user         | references  | null: false, foreign_key: true |

## Association
has_many :users

## purchase テーブル

| Column  | Type       |  Options    |
| ------- | ---------- | ----------- |
| user    | references | null: false |
| product | references | null: false |

## Association
belongs_to :users
belongs_to :products
has_one :buyers