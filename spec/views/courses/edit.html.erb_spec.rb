require 'rails_helper'

RSpec.describe "courses/edit", type: :view do
  before(:each) do
    @subject = assign(:subject, Subject.create!(
      name: "SubjectName"
    ))
    @course = assign(:course, @subject.courses.create!(
      name: "MyString"
    ))
  end

  it "renders the edit course form" do
    render

    assert_select "form[action=?][method=?]", subject_course_path(@subject, @course), "post" do

      assert_select "input[name=?]", "course[name]"
    end
  end
end
