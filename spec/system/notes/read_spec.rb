# frozen_string_literal: true

require "rails_helper"

RSpec.describe "read note", type: :system do
  before do
    user = FactoryBot.create(:user)
    login_as(user, scope: :user)
  end

  let!(:subject) { Subject.create(name: "Biology") }
  let!(:course) { subject.courses.create(name: "Biology 101", subject: subject) }

  it "displays entry" do
    course.notes.create(entry: "This is a note", course: course)
    visit subject_course_path(subject, course)

    expect(page).to have_content("This is a note")
  end

  it "displays edit button" do
    course.notes.create(entry: "This is a note", course: course)
    visit subject_course_path(subject, course)

    expect(page).to have_button("Edit")
  end

  it "displays destroy button" do
    course.notes.create(entry: "This is a note", course: course)
    visit subject_course_path(subject, course)

    expect(page).to have_button("Destroy")
  end
end
