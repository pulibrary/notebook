# frozen_string_literal: true

require "rails_helper"

RSpec.describe "courses/show", type: :view do
  let!(:user) { FactoryBot.create(:user) }
  let!(:subject) { FactoryBot.create(:subject, user: user) }
  let!(:course) { FactoryBot.create(:course, subject: subject) }

  before { login_as(user, scope: :user) }

  it "renders attributes in <p>" do
    assign(:subject, subject)
    assign(:course, course)
    render
    expect(rendered).to match(/Biology 101/)
  end
end
