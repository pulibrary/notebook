# frozen_string_literal: true

require "rails_helper"

RSpec.describe "notes/show", type: :view do
  let!(:subject) do
    Subject.create!(name: "SubjectName")
  end
  let!(:course) do
    subject.courses.create!(name: "CourseName")
  end
  let!(:note) do
    course.notes.create!(entry: "MyText")
  end

  it "renders attributes in <p>" do
    assign(:subject, subject)
    assign(:course, course)
    assign(:note, note)
    render
    expect(rendered).to match(/MyText/)
  end
end
