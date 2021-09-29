class Comment < ApplicationRecord
  belongs_to :ostomy
  belongs_to :staff
  validates :comment, {presence: true}
  #通知機能
   has_many :notifications, dependent: :destroy
end
