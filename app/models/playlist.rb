class Playlist < ApplicationRecord
    has_many :playlistgames, dependent: :destroy
    has_many :games, through: :playlistgames

    validates :content, uniqueness: true

end
