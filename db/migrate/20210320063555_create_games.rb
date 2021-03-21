class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.text :body
      t.text :title
      t.text :youtube_url
      t.integer :user_id
      t.timestamps
    end
  end
end
