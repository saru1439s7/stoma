class Ostomy < ApplicationRecord
  attachment :image
  belongs_to :patient
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :so_good, dependent: :destroy
  enum color: ["ピンク","あか","ちゃいろ","くろ","その他"]
  enum edema: ["なし","むくみあり","わからない"]
  enum skin: ["前回と同じ", "赤い","茶色","くろ","しろ","水疱"]
end
