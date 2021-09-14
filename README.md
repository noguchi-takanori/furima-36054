# テーブル設計
# usersテーブル
| Column               | Type    | Options                     |
| -------------------- | ------- | --------------------------- |
| email                | string  | null: false, uniquness:true |
| encrypted_password   | string  | null: false                 |
| nickname             | string  | null: false                 |
| birthday             | date    | null: false                 |
| last_name            | string  | null: false                 |
| first_name           | string  | null: false                 |
| last_name_kana       | string  | null: false                 |
| first_name_kana      | string  | null: false                 |

 has_many :items
 has_many :managements



# itemsテーブル
| Column             | Type           | Options                        |
| ------------------ | -------------- | ------------------------------ |
| price              | integer        | null: false                    |
| item_name          | string         | null: false                    |
| description_item   | text           | null: false                    |
| detail_category_id | integer        | null: false                    |
| detail_status_id   | integer        | null: false                    |
| payment_method_id  | integer        | null: false                    |
| shipment_source_id | integer        | null: false                    |
| scheduled_day_id   | integer        | null: false                    |
| user               | references     | null: false, foreign_key: true |

 belongs_to :user


# managementsテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | -----------                    |
| user              | references | null: false, foreign_key: true |
| item              | references | null: false, foreign_key: true |

 has_one :shipping-address
 belongs_to :item
 belongs_to :user

# shipping-addressテーブル
| Column         | Type       | Options                        |
|--------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| municipalities | string     | null: false                    |
| address        | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| management     | references | null: false, foreign_key: true |

 belongs_to :management