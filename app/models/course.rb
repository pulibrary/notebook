# frozen_string_literal: true

class Course < ApplicationRecord
  validates :name, presence: true, allow_blank: false
  belongs_to :subject
  has_many :notes, dependent: :destroy
  has_many :homeworks, dependent: :destroy
end
