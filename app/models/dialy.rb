class Dialy < ApplicationRecord
  #患者さんの健康記録
  has_one_attached :image
  belongs_to :patient
  #validates :color, {presence: true}
  
  #便の色
  enum color: {"brown":0,"black": 1,"light_brown": 2,"orange": 3,"yellow":4,"red":5,"other":6},_prefix:true
  #きぶん
  enum feeling: {"usual":0,"well":1,"good":2,"tired":3,"little_bad":4,"bad":5}, _prefix: true
end
