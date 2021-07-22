require 'rails_helper'

RSpec.describe Note, type: :model do
  describe 'associations' do
    it { should belong_to(:course).class_name('Course') }
  end

  describe 'validations' do
    it { should validate_presence_of(:entry) }
  end
end
