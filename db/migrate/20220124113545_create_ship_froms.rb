class CreateShipFroms < ActiveRecord::Migration[6.0]
  def change
    create_table :ship_froms do |t|
      t.integer    :ship_from_id     , null: false
      t.timestamps
    end
  end
end
