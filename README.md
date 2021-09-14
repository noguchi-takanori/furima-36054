# テーブル設計
# usersテーブル
| Column               | Type    | Options                     |
| -------------------- | ------- | --------------------------- |
| email                | string  | null: false, uniquness:true |
| encrypted_password   | string  | null: false                 |
| nickname             | string  | null: false                 |
| year                 | integer | null: false                 |
| month                | integer | null: false                 |
| day                  | integer | null: false                 |
| last_name            | string  | null: false                 |
| first_name           | string  | null: false                 |
| last_name_kana       | string  | null: false                 |
| first_name_kana      | string  | null: false                 |

- has_many :items
- has_many :management
- has_many :shipping-address



# itemsテーブル
| Column vvv       | Type           | Options                        |
| ---------------- | -------------- | ------------------------------ |
| price            | integer        | null: false                    |
| item_name        | string         | null: false                    |
| description_item | text           | null: false                    |
| detail_category  | string         | null: false                    |
| detail_status    | string         | null: false                    |
| payment_method   | string         | null: false                    |
| shipment_source  | string         | null: false                    |
| days             | integer        | null: false                    |
| image            | active_storage | null: false                    |
| user             | references     | null: false, foreign_key: true |

- belongs_to :user

# managementテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | -----------                    |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item

# shipping-addressテーブル
| Column         | Type       | Options                        |
|--------------- | ---------- | ------------------------------ |
| credit_number  | integer    | null: false                    |
| deadline       | string     | null: false                    |
| security       | integer    | null: false                    |
| postal_code    | string     | null: false                    |
| prefectures    | string     | null: false                    |
| municipalities | string     | null: false                    |
| address        | string     | null: false                    |
| building_name  | string     | null: false                    |
| phon_number    | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item