require 'rails_helper'

RSpec.describe "homeworks/edit", type: :view do
  before(:each) do
    @subject = assign(:subject, Subject.create!(
      name: "SubjectName"
    ))
    @course = assign(:course, @subject.courses.create!(
      name: "CourseName"
    ))
    @homework = assign(:homework, @course.homeworks.create!(
      entry: "MyText"
    ))
  end

  it "renders the edit homework form" do
    render

    assert_select "form[action=?][method=?]", subject_course_homework_path(@subject, @course, @homework), "post" do

      assert_select "textarea[name=?]", "homework[entry]"
    end
  end
end
