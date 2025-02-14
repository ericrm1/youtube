class FixSubscriberForeignKeyInSubscriptions < ActiveRecord::Migration[7.0]
  def change
    remove_reference :subscriptions, :subscriber, foreign_key: true
    add_reference :subscriptions, :subscriber, null: false, foreign_key: { to_table: :channels }
  end
end
