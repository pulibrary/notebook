require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'associations' do
    it { should belong_to(:subject).class_name('Subject') }
    it { should have_many(:notes) }
    it { should have_many(:homeworks) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
