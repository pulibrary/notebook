# frozen_string_literal: true

class Homework < ApplicationRecord
  validates :entry, presence: true, allow_blank: false
  validates :due_at, presence: true, allow_blank: false
  belongs_to :course
end
