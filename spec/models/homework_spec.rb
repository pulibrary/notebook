require 'rails_helper'

RSpec.describe Homework, type: :model do
  describe 'associations' do
    it { should belong_to(:course).class_name('Course') }
  end

  describe 'validations' do
    it { should validate_presence_of(:entry) }
    it { should validate_presence_of(:due_at) }
  end
end
