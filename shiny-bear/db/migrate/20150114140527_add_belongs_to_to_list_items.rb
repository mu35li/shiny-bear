class AddBelongsToToListItems < ActiveRecord::Migration
  def change
    add_column :list_items, :belongs_to, :integer
  end
end
