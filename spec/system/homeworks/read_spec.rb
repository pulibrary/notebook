# frozen_string_literal: true

require "rails_helper"

RSpec.describe "read homework", type: :system do
  before do
    user = FactoryBot.create(:user)
    login_as(user, scope: :user)
  end

  let!(:subject) { Subject.create(name: "Biology") }
  let!(:course) { subject.courses.create(name: "Biology 101", subject: subject) }

  it "displays entry" do
    course.homeworks.create(entry: "This is a homework", due_at: DateTime.parse("Mon 2nd Aug 2021 04:05:06+03:30"),
                            course: course)
    visit subject_course_path(subject, course)

    expect(page).to have_content("This is a homework")
  end

  it "displays due date" do
    course.homeworks.create(entry: "This is a homework", due_at: DateTime.parse("Mon 2nd Aug 2021 04:05:06+03:30"),
                            course: course)
    visit subject_course_path(subject, course)

    expect(page).to have_content("Due on: Mon, 02 Aug 2021")
  end

  it "displays edit button" do
    course.homeworks.create(entry: "This is a homework", due_at: DateTime.parse("Mon 2nd Aug 2021 04:05:06+03:30"),
                            course: course)
    visit subject_course_path(subject, course)

    expect(page).to have_button("Edit")
  end

  it "displays destroy button" do
    course.homeworks.create(entry: "This is a homework", due_at: DateTime.parse("Mon 2nd Aug 2021 04:05:06+03:30"),
                            course: course)
    visit subject_course_path(subject, course)

    expect(page).to have_button("Destroy")
  end
end
