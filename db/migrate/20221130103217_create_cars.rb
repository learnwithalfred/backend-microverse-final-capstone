class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :name, null: false
      t.string :image, null: false
      t.string :brand, null: false
      t.integer :duration, null: false
      t.integer :total_amount_payable, null: false
      t.integer :option_to_purchase_fee, null: false

      t.timestamps
    end
  end
end
