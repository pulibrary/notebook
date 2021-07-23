class Course < ApplicationRecord
  validates :name, presence: true
  belongs_to :subject
  has_many :notes, dependent: :destroy
  has_many :homeworks, dependent: :destroy
end
