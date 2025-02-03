class CreateRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :ratings do |t|
      t.references :channel, null: false, foreign_key: true
      t.references :video, null: false, foreign_key: true
      t.integer :value

      t.timestamps
    end
  end
end
