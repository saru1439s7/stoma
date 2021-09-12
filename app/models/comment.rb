class Comment < ApplicationRecord
  belongs_to :ostomy
  belongs_to :staff
  validates :content, {presence: true}
end
