class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

        has_many :games, dependent: :destroy
        has_many :likes, dependent: :destroy
        has_many :liked_games, through: :likes, source: :game
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

        def already_liked?(game)
          self.likes.exists?(game_id: game.id)
        end
end
