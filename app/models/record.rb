class Record < ApplicationRecord
  #staffのストマ記録
   attachment :image
   belongs_to :staff
   #ABC分類
   enum adjacent: [ "障害なし","紅斑","びらん","水疱・膿疱","潰瘍・組織増大"]
   enum barrier: ["障害なし","紅斑","びらん","水疱・膿疱","潰瘍・組織増大"]
   enum circumscribing: ["障害なし","紅斑","びらん","水疱・膿疱","潰瘍・組織増大"]
   enum discoloration: ["障害なし","色素沈着","色素脱失","色素沈着・色素脱失"]
end
