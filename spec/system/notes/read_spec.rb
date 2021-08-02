require 'rails_helper'

RSpec.describe 'read note', type: :system do
  let!(:subject) { Subject.create(name: "Biology") }
  let!(:course) { subject.courses.create(name: "Biology 101", subject: subject) }
  let!(:note) { course.notes.create(entry: "This is a note", course: course) }

  scenario 'entry exists' do
    visit subject_course_path(subject, course)

    expect(page).to have_content("This is a note")
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