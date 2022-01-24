## usersテーブル

|Column|Type|Options|
| ------  | ---- | ------- |
| email  | string | null: false, unique: true |
| encrypted_password  | string | null: false |
| nickname  | string | null: false |
| lastname_character  | string | null: false |
| lastname_katakana  | string | null: false |
| name_character  | string | null: false |
| name_katakana  | string | null: false |
| birthday  | date | null: false |

### Association
has_many :products
has_many :purchases

## productsテーブル

|Column|Type|Options|
| ------  | ---- | ------- |
| price  | integer | null: false |
| name_products  | string | null: false |
| explanation  | text | null: false |
| user  | references | null: false, foreign_key:true |

### Association
belongs_to :user
has_one :purchase

## destinationsテーブル

|Column|Type|Options|
| ------  | ---- | ------- |
| postal_code  | string | null: false |
| ship_from  | integer | null: false |
| city  | string | null: false |
| house_number  | string | null: false |
| building_name  | string | null: false |
| telephone_number  | string |
| purchase  | references | null: false, foreign_key:true |

### Association
belongs_to :purchase

## purchasesテーブル

|Column|Type|Options|
| ------  | ---- | ------- |
| user  | references | null: false, foreign_key:true |
| product  | references | null: false, foreign_key:true |

### Association
belongs_to :user
belongs_to :product