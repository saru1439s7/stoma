class Comment < ApplicationRecord
  belongs_to :ostomy
  belongs_to :staff
  validates :comment, {presence: true}
end
