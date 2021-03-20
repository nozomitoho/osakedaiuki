class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

        has_many :games, dependent: :destroy
        has_many :likes, dependent: :destroy
        has_many :liked_games, through: :likes, source: :game
        validates :name, presence: true
        
        def already_liked?(game)
          self.likes.exists?(game_id: game.id)
        end
end
