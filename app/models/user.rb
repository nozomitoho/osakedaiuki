class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

        has_many :games, dependent: :destroy
        has_many :likes, dependent: :destroy
        has_many :liked_games, through: :likes, source: :game

        #nameは空だとダメ。かつ登録してある名前は新しく使えない。
        validates :name, presence: true, uniqueness: true, length: {maximum: 50}
        
        def already_liked?(game)
          self.likes.exists?(game_id: game.id)
        end

        #登録時にメールアドレスを不要とする：shotaro
        def email_required?
          false
        end
      
        def email_changed?
          false
        end
end
