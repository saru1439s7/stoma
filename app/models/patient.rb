class Patient < ApplicationRecord
 
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
  # 通知機能
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
end
