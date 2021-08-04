# frozen_string_literal: true

require "rails_helper"

RSpec.describe "homeworks/edit", type: :view do
  before do
    user = FactoryBot.create(:user)
    login_as(user, scope: :user)
  end

  let!(:subject) do
    Subject.create!(name: "SubjectName")
  end
  let!(:course) do
    subject.courses.create!(name: "CourseName")
  end
  let!(:homework) do
    course.homeworks.create!(entry: "MyText", due_at: DateTime.now)
  end

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
