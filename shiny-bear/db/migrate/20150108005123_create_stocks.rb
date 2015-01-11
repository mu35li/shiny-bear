class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :item
      t.integer :count
      t.boolean :rebuy

      t.timestamps null: false
    end
  end
end
