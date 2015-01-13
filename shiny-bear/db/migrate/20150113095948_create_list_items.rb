class CreateListItems < ActiveRecord::Migration
  def change
    create_table :list_items do |t|
      t.string :item
      t.integer :count
      t.boolean :important

      t.timestamps null: false
    end
  end
end
