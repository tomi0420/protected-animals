class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :user_address
  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :likes

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'

  with_options presence: true do
    validates :nickname
    validates :email, uniqueness: { case_sensitive: true }
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'Full-width characters' } do
    validates :last_name, :first_name
  end

  with_options presence: true, format: { with: /[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/, message: 'Full-width katakana characters' } do
    validates :last_name_kana, :first_name_kana
  end

  def liked_by?(animal_id)
    likes.where(animal_id: animal_id).exists?
  end

end
