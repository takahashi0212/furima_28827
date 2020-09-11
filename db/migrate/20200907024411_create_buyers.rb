class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.string     :post_code,      null: false
      t.integer    :zone_id,        null: false
      t.string     :city,           null: false
      t.string     :adress,         null: false
      t.string     :building
      t.string     :phone_number,   null: false
      t.references :purchase,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
