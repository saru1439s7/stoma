class Record < ApplicationRecord
  #医療staffがかくストマ記録
   has_one_attached :image
   belongs_to :patient
   
   
  validates :adjacent, {presence: true}
  validates :barrier, {presence: true}
  validates :circumscribing, {presence: true}
  validates :discolor, {presence: true}
   
   #ABC分類 #0:障害なし 1:紅斑 2:びらん 3:水疱膿疱 4:潰瘍組織増大
    #A:近接部:ストーマからストーマ装具の皮膚保護剤までの範囲
   enum adjacent: { "acceptable":0,"erythema":1,"erosion":2,"blister":3,"ulceration":15}, _prefix: true
    #B:皮膚保護剤部:皮膚保護剤が触れていた範囲
   enum barrier: {"acceptable":0,"erythema":1,"erosion":2,"blister":3,"ulceration":15}, _prefix: true
    #C:皮膚保護剤外部
   enum circumscribing: {"acceptable":0,"erythema":1,"erosion":2,"blister":3,"ulceration":15}, _prefix: true
    #D:ABCの合わせた部位の色調の変化   #0:障害なし 1:色素沈着 2:色素脱失 3:色素沈着・色素脱失
   enum discolor: {"acceptable":0,"spot":1,"depigmentation":2,"both":3}, _prefix: true

   #A+B+Cの合計を出す
   def point
     adjacent_before_type_cast + barrier_before_type_cast + circumscribing_before_type_cast
   end
   
   #Dの点数を表示させる
   def d_point
     discolor_before_type_cast
   end
end
