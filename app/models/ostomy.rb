class Ostomy < ApplicationRecord
  attachment :image
  belongs_to :patient
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :so_good, dependent: :destroy
  enum color: {"pink":0,"red": 1,"brown": 2,"black": 3,"other":4}, _prefix:true
  #enum color: ["ピンク", "あか","ちゃいろ","くろ","その他"], _prefix:true
  #enum color: {"ピンク":0, "あか":1,"ちゃいろ":2,"くろ":3,"その他":4},_prefix:true

  enum skin: {"same":0,"red":1,"brown":2,"black":3,"white":4,"blister":5}, _prefix: true
  #enum skin: ["前回と同じ","あか","ちゃいろ","くろ","しろ","水疱"], _prefix: true
  #enum skin: {"前回と同じ":0,"あか":1,"ちゃいろ":2,"くろ":3,"しろ":4,"水疱":5}, _prefix: true
  enum edema: {"normal":0,"edema":1}, _prefix: true
end
