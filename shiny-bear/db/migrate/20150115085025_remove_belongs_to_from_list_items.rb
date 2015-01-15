class RemoveBelongsToFromListItems < ActiveRecord::Migration
  def change
    remove_column :list_items, :belongs_to, :integer
    add_column :list_items, :list_id, :integer
  end
end
