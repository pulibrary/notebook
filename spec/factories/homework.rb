# frozen_string_literal: true

FactoryBot.define do
  factory :homework do
    entry { "Biology homework" }
    due_at { DateTime.now }
    course { nil }
  end
end
