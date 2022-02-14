class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|

      t.integer :price,        null: false
      t.string :name_products, null: false
      t.text :explanation,     null: false
      t.integer :category_id,  null: false
      t.integer :condition_id, null: false
      t.integer :delivery_id,  null: false
      t.integer :ship_from_id, null: false
      t.integer :ship_day_id,  null: false
      t.references :user,      null: false, foreign_key: true

      t.timestamps
    end
  end
end
