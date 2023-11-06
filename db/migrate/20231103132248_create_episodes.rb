class CreateEpisodes < ActiveRecord::Migration[7.1]
  def change
    create_table :episodes do |t|
      t.references :feed, null: false, foreign_key: true
      t.string :title
      t.string :duration
      t.timestamp :published_at
      t.text :description
      t.string :mimetype
      t.string :url
      t.integer :bytes
      t.string :guid

      t.timestamps
    end
    add_index :episodes, :url
  end
end
