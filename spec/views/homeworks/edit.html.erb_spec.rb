# frozen_string_literal: true

require "rails_helper"

RSpec.describe "homeworks/edit", type: :view do
  let!(:user) { User.create(email: "user@test.com", password: "testpass") }
  let!(:subject) { Subject.create!(name: "SubjectName", user: user) }
  let!(:course) { subject.courses.create!(name: "CourseName") }
  let!(:homework) { course.homeworks.create!(entry: "MyText", due_at: DateTime.now) }

  before { login_as(user, scope: :user) }

  it "renders the edit homework form" do
    assign(:subject, subject)
    assign(:course, course)
    assign(:homework, homework)
    render
    assert_select "form[action=?][method=?]", subject_course_homework_path(subject, course, homework), "post" do
      assert_select "textarea[name=?]", "homework[entry]"
    end
  end
end
