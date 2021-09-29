class Notification < ApplicationRecord
  #作成した順序で並べる
  default_scope -> { order(created_at: :desc) }
  belongs_to :ostomy, optional: true
  belongs_to :comment, optional: true

  # optional: trueにてnilを許可
  # belongs_to :visitor, class_name: 'Patient', foreign_key: 'visitor_id', optional: true
  belongs_to :visited, class_name: 'Patient', foreign_key: 'visited_id', optional: true
  belongs_to :visitor, class_name: 'Staff', foreign_key: 'visitor_id', optional: true
  # belongs_to :visited, class_name: 'Staff', foreign_key: 'visited_id', optional: true
end
