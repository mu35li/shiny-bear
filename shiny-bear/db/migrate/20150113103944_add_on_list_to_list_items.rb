class AddOnListToListItems < ActiveRecord::Migration
  def change
    add_column :list_items, :on_list, :integer
  end
end
