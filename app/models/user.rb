class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,           presence: true
  validates :birthday,           presence: true
  validates :last_name,          presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/}
  validates :first_name,         presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/}
  validates :last_name_kana,     presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/}
  validates :first_name_kana,    presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/}
  validates :encrypted_password, presence: true, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/}

  has_many  :items
end
