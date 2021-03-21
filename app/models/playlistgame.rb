class Playlistgame < ApplicationRecord
  belongs_to :playlist
  belongs_to :game
end
