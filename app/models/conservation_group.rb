class ConservationGroup < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :conservation_group_address

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'

  with_options presence: true do
    validates :group_name
    validates :nickname
    validates :email, uniqueness: { case_sensitive: true }
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'Full-width characters' } do
    validates :last_name, :first_name
  end

  with_options presence: true, format: { with: /[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/, message: 'Full-width katakana characters' } do
    validates :last_name_kana, :first_name_kana
  end
  
end
