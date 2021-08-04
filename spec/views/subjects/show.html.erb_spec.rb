# frozen_string_literal: true

require "rails_helper"

RSpec.describe "subjects/show", type: :view do
  let!(:user) { User.create(email: "user@test.com", password: "testpass") }
  let!(:subject) { Subject.create!(name: "SubjectName", user: user) }

  before { login_as(user, scope: :user) }

  it "renders attributes in <p>" do
    assign(:subject, subject)
    render
    expect(rendered).to match(/Name/)
  end
end
