class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.integer    :delivery_id     , null: false
      t.timestamps
    end
  end
end
