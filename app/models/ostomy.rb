class Ostomy < ApplicationRecord
  #患者さんのストーマの記録
  has_one_attached :image
  belongs_to :patient
  has_many :comments
  has_many :favorites
  #has_many :so_good, dependent: :destroy
  validates :color, {presence: true}
  validates :edema, {presence: true}
  validates :skin, {presence: true}

#ストマの色
  enum color: {"pink":0,"red": 1,"brown": 2,"black": 3,"other":4}, _prefix:true
#皮膚の色
  enum skin: {"same":0,"red":1,"brown":2,"black":3,"white":4,"blister":5}, _prefix: true
#むくみ
  enum edema: {"normal":0,"edema":1}, _prefix: true

  def favorited_by?(staff)
    favorites.where(staff_id: staff.id).exists?
  end
end
