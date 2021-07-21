require 'rails_helper'

RSpec.describe "notes/edit", type: :view do
  before(:each) do
    @subject = assign(:subject, Subject.create!(
      name: "SubjectName"
    ))
    @course = assign(:course, @subject.courses.create!(
      name: "CourseName"
    ))
    @note = assign(:note, @course.notes.create!(
      entry: "MyText"
    ))
  end

  it "renders the edit note form" do
    render

    assert_select "form[action=?][method=?]", subject_course_note_path(@subject, @course, @note), "post" do

      assert_select "textarea[name=?]", "note[entry]"
    end
  end
end
