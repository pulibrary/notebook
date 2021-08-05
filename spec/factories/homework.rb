# frozen_string_literal: true

FactoryBot.define do
  factory :homework do
    entry { "Biology homework" }
    due_at { DateTime.parse("Mon 2nd Aug 2021 04:05:06+03:30") }
    course
  end
end
