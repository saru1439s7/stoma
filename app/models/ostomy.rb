class Ostomy < ApplicationRecord
  attachment :image
  belongs_to :patient
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :so_good, dependent: :destroy
  enum color: [ピンク: 0,あか: 1,ちゃいろ: 2,くろ: 3,その他:4], _prefix:true
  enum edema: ["なし","むくみあり"], _prefix: true
  enum skin: ["前回と同じ", "赤い","茶色","黒","しろ","水疱"], _prefix: true
end
