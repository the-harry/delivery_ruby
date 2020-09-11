class CreateCostumers < ActiveRecord::Migration[6.0]
  def change
    create_table :costumers do |t|
      t.string :external_id
      t.string :name
      t.string :email
      t.string :contact
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
