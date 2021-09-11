# テーブル設計
# usersテーブル
| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| nickname   | string | null: false |

# itemsテーブル
| Column       | Type       | Options     |
|--------------|------------|-------------|
| product-name | string     | null: false |
| price        | integer    | null: false |
| detail       | text       | null: false |
| users        | references |             |

# commentsテーブル

| Column       | Type       | Options     |

| comment      | text       | null: false |
| user         | references |             |
| item         | refetences |             |