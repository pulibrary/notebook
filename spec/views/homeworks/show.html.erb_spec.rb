# frozen_string_literal: true

require "rails_helper"

RSpec.describe "homeworks/show", type: :view do
  let!(:subject) do
    Subject.create!(name: "SubjectName")
  end
  let!(:course) do
    subject.courses.create!(name: "CourseName")
  end
  let!(:homework) do
    course.homeworks.create!(entry: "MyText", due_at: DateTime.now)
  end

  it "renders attributes in <p>" do
    assign(:subject, subject)
    assign(:course, course)
    assign(:homework, homework)
    render
    expect(rendered).to match(/MyText/)
  end
end
