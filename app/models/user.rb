class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

        has_many :games, dependent: :destroy
        has_many :likes, dependent: :destroy
        has_many :liked_games, through: :likes, source: :game
<<<<<<< HEAD

        #nameは空だとダメ。かつ登録してある名前は新しく使えない。
        validates :name, presence: true, uniqueness: true, length: {maximum: 50}
        
=======
        validates :name, presence: true

        has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship",  dependent: :destroy
        has_many :following, through: :following_relationships
        has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
        has_many :followers, through: :follower_relationships

        #フォローしているかを確認するメソッド
  def following?(user)
    following_relationships.find_by(following_id: user.id)
  end

  #フォローするときのメソッド
  def follow(user)
    following_relationships.create!(following_id: user.id)
  end

  #フォローを外すときのメソッド
  def unfollow(user)
    following_relationships.find_by(following_id: user.id).destroy
  end

>>>>>>> origin/master
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
