# frozen_string_literal: true

require "rails_helper"

RSpec.describe "courses/edit", type: :view do
  let!(:user) { User.create(email: "user@test.com", password: "testpass") }
  let!(:subject) { Subject.create!(name: "SubjectName", user: user) }
  let!(:course) { subject.courses.create!(name: "MyString") }

  before { login_as(user, scope: :user) }

  it "renders the edit course form" do
    assign(:subject, subject)
    assign(:course, course)
    render
    assert_select "form[action=?][method=?]", subject_course_path(subject, course), "post" do
      assert_select "input[name=?]", "course[name]"
    end
  end
end
