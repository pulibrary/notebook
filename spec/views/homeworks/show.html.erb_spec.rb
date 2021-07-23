require 'rails_helper'

RSpec.describe "homeworks/show", type: :view do
  before(:each) do
    @subject = assign(:subject, Subject.create!(
      name: "SubjectName"
    ))
    @course = assign(:course, @subject.courses.create!(
      name: "CourseName"
    ))
    @homework = assign(:homework, @course.homeworks.create!(
      entry: "MyText",
      due_at: DateTime.now
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
  end
end
