class Note < ApplicationRecord
  validates :entry, presence: true
  belongs_to :course
end
