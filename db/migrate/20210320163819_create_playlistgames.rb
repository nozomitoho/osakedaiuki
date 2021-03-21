class CreatePlaylistgames < ActiveRecord::Migration[6.0]
  def change
    create_table :playlistgames do |t|
      t.references :playlist, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
