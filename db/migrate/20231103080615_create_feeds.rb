class CreateFeeds < ActiveRecord::Migration[7.1]
  def change
    create_table :feeds do |t|
      t.string :url
      t.string :name
      t.text :description
      t.string :image

      t.timestamps
    end
    add_index :feeds, :url
    add_index :feeds, :name
  end
end
