# frozen_string_literal: true

class Subject < ApplicationRecord
  validates :name, presence: true, allow_blank: false
  has_many :courses, dependent: :destroy
  belongs_to :user
end
