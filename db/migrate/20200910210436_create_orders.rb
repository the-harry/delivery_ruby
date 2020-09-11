class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :external_code
      t.integer :store_id
      t.string :sub_total
      t.string :delivery_fee
      t.string :total
      t.string :country
      t.string :state
      t.string :city
      t.string :district
      t.string :street
      t.string :complement
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6
      t.string :dt_order_create
      t.string :postal_code
      t.string :number
      t.float :total_shipping

      t.timestamps
    end
  end
end
