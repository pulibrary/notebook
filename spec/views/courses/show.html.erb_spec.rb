require 'rails_helper'

RSpec.describe "courses/show", type: :view do
  before(:each) do
    @subject = assign(:subject, Subject.create!(
      name: "SubjectName"
    ))
    @course = assign(:course, @subject.courses.create!(
      name: "CourseName"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/CourseName/)
  end
end
