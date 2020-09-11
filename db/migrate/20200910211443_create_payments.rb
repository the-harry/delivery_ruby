class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.string :modality
      t.float :value
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
