class Patient < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :image
  validates :name, presence: true
  validates :name_kana, presence: true
  validates :email, presence: true

   has_many :ostomies
   has_many :dialies
   has_many :calenders
   has_many :records
end
