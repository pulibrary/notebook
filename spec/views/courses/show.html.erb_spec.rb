# frozen_string_literal: true

require "rails_helper"

RSpec.describe "courses/show", type: :view do
  let!(:user) { User.create(email: "user@test.com", password: "testpass") }
  let!(:subject) { Subject.create!(name: "SubjectName", user: user) }
  let!(:course) { subject.courses.create!(name: "CourseName") }

  before { login_as(user, scope: :user) }

  it "renders attributes in <p>" do
    assign(:subject, subject)
    assign(:course, course)
    render
    expect(rendered).to match(/CourseName/)
  end
end
