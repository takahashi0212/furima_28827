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

## login テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| emai     | references | null: false, foreign_key: true |
| password | references | null: false, foreign_key: true |

## product テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ | 
| image       | string     | null: false                    |
| name        | string     | null: false                    |
| description | text       | null: false                    |
| category    | references | null: false, foreign_key: true |
| status      | references | null: false, foreign_key: true |
| cost        | references | null: false, foreign_key: true |
| zone        | references | null: false, foreign_key: true |
| days        | refarences | null: false, foreign_key: ture |
| price       | refarences | null: false, foreign_key: ture |

## buyer テーブル

| Column       | Type        | Options                        |
| ------------ | ----------- | ------------------------------ |
| post_code    | integer     | null: false                    |
| prefecture   | references  | null: false, foreign_key: true |
| city         | string      | null: false                    |
| adress       | string      | null: false                    |
| building     | string      |                                |
| phone_number | integer     | null:false                     |