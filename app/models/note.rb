# frozen_string_literal: true

class Note < ApplicationRecord
  validates :entry, presence: true, allow_blank: false
  belongs_to :course
end
