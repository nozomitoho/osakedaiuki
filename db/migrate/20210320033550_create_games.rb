class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.text :body
      t.text :title

      t.timestamps
    end
  end
end
