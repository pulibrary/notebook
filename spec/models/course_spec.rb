# frozen_string_literal: true

require "rails_helper"

RSpec.describe Course, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:subject).class_name("Subject") }
    it { is_expected.to have_many(:notes) }
    it { is_expected.to have_many(:homeworks) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
  end
end
