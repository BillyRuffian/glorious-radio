class AddImageToEpisodes < ActiveRecord::Migration[7.1]
  def change
    add_column :episodes, :image, :string
  end
end
