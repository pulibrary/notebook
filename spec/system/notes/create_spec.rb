require 'rails_helper'

RSpec.describe 'create note', type: :system do
  let!(:subject) { Subject.create(name: "Biology") }
  let!(:course) { subject.courses.create(name: "Biology 101", subject: subject) }

  scenario 'empty entry' do
    visit subject_course_path(subject, course)
    click_button 'Create Note'

    expect(page).to have_content("Unable to create note")

    expect(Note.count).to eq(0)
  end

  scenario 'valid entry' do
    visit subject_course_path(subject, course)

    within('.new-note') do
      fill_in 'Entry', with: 'This is a note entry'
    end
    click_button 'Create Note'

    expect(page).to have_content("Note was successfully created")

    expect(Note.count).to eq(1)

    expect(Note.last.entry).to eq('This is a note entry')
  end
end