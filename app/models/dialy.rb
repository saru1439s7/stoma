class Dialy < ApplicationRecord
  attachment :image
  belongs_to :patient
  enum color: ["ちゃいろ", "うすちゃいろ","くろ","オレンジ","きいろ","しろ","あか","みどり"], _prefix: true
  enum amount: ["いつもと同じ", "少ない","多い"], _prefix: true
  enum feeling: ["いい", "ふつう","まあまあ","わるい","つかれてる"], _prefix: true
end
