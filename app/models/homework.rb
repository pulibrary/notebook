class Homework < ApplicationRecord
  validates :entry, presence: true
  validates :due_at, presence: true
  belongs_to :course
end
