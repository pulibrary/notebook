require 'rails_helper'

RSpec.describe Subject, type: :model do
  describe 'associations' do
    it { should have_many(:courses) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
