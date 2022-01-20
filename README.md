## usersテーブル

|Column|Type|Options|
| ------  | ---- | ------- |
| mail  | string | null: false, unique: true |
| encrypted_password  | string | null: false |
| nickname  | string | null: false |
| lastname_character  | string | null: false |
| lastname_katakana  | string | null: false |
| name_character  | string | null: false |
| name_katakana  | string | null: false |
| birthday  | string | null: false |

### Association
has_many :products
has_many :purchases

## productsテーブル

|Column|Type|Options|
| ------  | ---- | ------- |
| price  | string | null: false |
| name_products  | string | null: false |
| describe  | text | null: false |
| category  | string | null: false |
| condition  | string | null: false |
| delivery  | string | null: false |
| ship_from  | string | null: false |
| ship_day  | string | null: false |
| commission  | string | null: false |
| profit  | string | null: false |
| user  | references | null: false, foreign_key:true |

### Association
belongs_to :user
has_one :purchase

## destinationsテーブル

|Column|Type|Options|
| ------  | ---- | ------- |
| postal_code  | string | null: false |
| prefecture  | string | null: false |
| city  | string | null: false |
| house_number  | string | null: false |
| building_name  | string | null: false |
| telephone_number  | string | null: false |
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