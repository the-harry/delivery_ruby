class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :external_code
      t.string :name
      t.float :price
      t.integer :quantity
      t.float :total
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
