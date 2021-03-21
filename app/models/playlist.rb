class Playlist < ApplicationRecord
    has_many :playlistgames
    has_many :games, through: :playlistgames
end
