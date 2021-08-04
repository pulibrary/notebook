# frozen_string_literal: true

require "rails_helper"

RSpec.describe "subjects/show", type: :view do
  let!(:user) { FactoryBot.create(:user) }
  let!(:subject) { FactoryBot.create(:subject, user: user) }

  before { login_as(user, scope: :user) }

  it "renders attributes in <p>" do
    assign(:subject, subject)
    render
    expect(rendered).to match(/Biology/)
  end
end
