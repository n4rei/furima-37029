class CreateShipDays < ActiveRecord::Migration[6.0]
  def change
    create_table :ship_days do |t|
      t.integer    :ship_day_id     , null: false
      t.timestamps
    end
  end
end
