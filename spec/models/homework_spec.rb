# frozen_string_literal: true

require "rails_helper"

RSpec.describe Homework, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:course).class_name("Course") }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:entry) }
    it { is_expected.to validate_presence_of(:due_at) }
  end
end
