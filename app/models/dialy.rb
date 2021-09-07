class Dialy < ApplicationRecord
  attachment :image
  belongs_to :patient
  
  enum color: {"brown":0,"black": 1,"light_brown": 2,"orange": 3,"yellow":4,"red":5,"other":6},_prefix:true
  enum feeling: {"usual":0,"well":1,"good":2,"tired":3,"little_bad":4,"bad":5}, _prefix: true
end
