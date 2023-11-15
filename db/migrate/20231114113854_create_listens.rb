class CreateListens < ActiveRecord::Migration[7.1]
  def change
    create_table :listens do |t|
      t.references :user, null: false, foreign_key: true
      t.references :episode, null: false, foreign_key: true
      t.integer :play_count, default: 0
      t.integer :position

      t.timestamps
    end
  end
end
