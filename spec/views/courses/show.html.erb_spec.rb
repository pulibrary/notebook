# frozen_string_literal: true

require "rails_helper"

RSpec.describe "courses/show", type: :view do
  let(:subject) { FactoryBot.create(:subject) }
  let(:course) { FactoryBot.create(:course) }

  before do
    user = FactoryBot.create(:user)
    sign_in user
  end

  it "renders attributes in <p>" do
    assign(:subject, subject)
    assign(:course, course)
    render
    expect(rendered).to match(/Biology 101/)
  end
end
