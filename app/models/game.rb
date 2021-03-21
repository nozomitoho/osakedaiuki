class Game < ApplicationRecord
    belongs_to :user

    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user

    has_many :playlistgames
    has_many :playlists, through: :playlistgames

    has_many :game_tags, dependent: :destroy
    has_many :tags, through: :game_tags
end
