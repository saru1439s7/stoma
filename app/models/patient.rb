class Patient < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   attachment :image
   has_many :ostomies
   has_many :dialies
   has_many :calenders
   has_many :records
end
