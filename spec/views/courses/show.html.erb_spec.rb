# frozen_string_literal: true

require "rails_helper"

RSpec.describe "courses/show", type: :view do
  let!(:subject) do
    Subject.create!(name: "SubjectName")
  end
  let!(:course) do
    subject.courses.create!(name: "CourseName")
  end

  it "renders attributes in <p>" do
    assign(:subject, subject)
    assign(:course, course)
    render
    expect(rendered).to match(/CourseName/)
  end
end
