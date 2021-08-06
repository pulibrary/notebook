# frozen_string_literal: true

require "rails_helper"

RSpec.describe "subjects/show", type: :view do
  let(:subject) { FactoryBot.create(:subject) }

  before do
    user = FactoryBot.create(:user)
    sign_in user
  end

  it "renders attributes in <p>" do
    assign(:subject, subject)
    render
    expect(rendered).to match(/Biology/)
  end
end
