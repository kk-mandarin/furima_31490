# README

## usersテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| nickname   | string | null: false |
| email   | string | null: false, unique: true |
| encrypted_password  | string | null: false |
| family_name   | string | null: false |
| first_name  | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana  | string | null: false |
| birthday   | date | null: false |

### Association
has_many:lists
has_many:orders
has_many:comments

## listsテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | string | null: false |
| item_content  | text | null: false |
| category_id  | integer | null: false |
| item_condition_id  | integer | null: false |
| delivery_fee_id  | integer | null: false |
| prefecture_id | integer | null: false |
| shipping_date_id  | integer | null: false |
| price  | integer | null: false |
| user  | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :order
has_many :comments


## buyersテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| post_number  | string | null: false |
| prefecture_id  | integer | null: false |
| municipality  | string | null: false |
| address | string | null: false |
| building | string |
| phone_number | string | null: false |
| order  | references | null: false, foreign_key: true |

### Association
belongs_to :order

## ordersテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| list  | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :list
has_one :buyer


## commentsテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text | null: false |
| user  | references | null: false, foreign_key: true |
| list  | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :lists