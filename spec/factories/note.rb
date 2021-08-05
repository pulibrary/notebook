# frozen_string_literal: true

FactoryBot.define do
  factory :note do
    entry { "Biology note" }
    course
  end
end
