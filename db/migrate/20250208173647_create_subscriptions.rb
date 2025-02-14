class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.references :channel, null: false, foreign_key: true
      t.references :subscriber, null: false, foreign_key: { to_table: :channels }
      t.timestamps
    end
  end
end
