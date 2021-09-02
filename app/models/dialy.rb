class Dialy < ApplicationRecord
  attachment :image
  belongs_to :patient
  enum color: ["ちゃいろ", "うすちゃいろ","くろ","オレンジ","きいろ","しろ","あか","みどり"]
  enum amount: ["いつもと同じ", "少ない","多い"]
  enum feeling: ["いい", "ふつう","まあまあ","わるい","つかれてる"]
end
