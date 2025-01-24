class RemoveContentAndParentIdFromComments < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :content, :text
    remove_column :comments, :parent_id, :integer
  end
end
