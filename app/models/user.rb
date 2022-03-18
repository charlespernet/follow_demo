class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :follows
  has_many :followers, foreign_key: :followed_id, class_name: "Follow"
  has_many :followings, through: :follows, source: :followed

  def is_following?(user)
    followings.exists?(user.id)
  end
end
