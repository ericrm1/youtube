class RenameUsersToChannels < ActiveRecord::Migration[7.0]
  def change
    rename_table :users, :channels
  end
end
