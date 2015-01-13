class RemoveOnListFromListItems < ActiveRecord::Migration
  def change
    remove_column :list_items, :on_list, :integer
  end
end
