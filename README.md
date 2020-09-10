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
| birth_day        | date   | null: false |

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
| user        | references | null: false, foreign_key: true |

## Association
belongs_to :user
has_one :buyers
has_one :purchase

## buyers テーブル

| Column       | Type        | Options                        |
| ------------ | ----------- | ------------------------------ |
| post_code    | string      | null: false                    |
| zone         | integer     | null: false                    |
| city         | string      | null: false                    |
| adress       | string      | null: false                    |
| building     | string      |                                |
| phone_number | string      | null: false                    |
| purchases    | references  | null: false, foreign_key: true |

## Association
belongs_to :purchase
belongs_to :product

## purchases テーブル

| Column      | Type       |  Options                       |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| product     | references | null: false, foreign_key: true |

## Association
belongs_to :user
belongs_to :product
has_one :buyer