require 'rails_helper'

RSpec.describe 'read homework', type: :system do
  let!(:subject) { Subject.create(name: "Biology") }
  let!(:course) { subject.courses.create(name: "Biology 101", subject: subject) }
  let!(:homework) { course.homeworks.create(entry: "This is a homework", due_at: DateTime.parse('Mon 2nd Aug 2021 04:05:06+03:30'), course: course) }

  scenario 'entry exists' do
    visit subject_course_path(subject, course)

    expect(page).to have_content("This is a homework")
  end

  scenario 'due date exists' do
    visit subject_course_path(subject, course)

    expect(page).to have_content("Due on: Mon, 02 Aug 2021")
  end

  scenario 'edit button exists' do
    visit subject_course_path(subject, course)

    expect(page).to have_button("Edit")
  end

  scenario 'destroy button exists' do
    visit subject_course_path(subject, course)

    expect(page).to have_button("Destroy")
  end
end