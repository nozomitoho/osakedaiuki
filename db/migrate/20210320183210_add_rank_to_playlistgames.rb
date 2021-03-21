class AddRankToPlaylistgames < ActiveRecord::Migration[6.0]
  def change
    add_column :playlistgames, :rank, :integer, default: 1000
  end
end
