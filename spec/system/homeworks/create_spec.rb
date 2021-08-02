require 'rails_helper'

RSpec.describe 'create homework', type: :system do
  let!(:subject) { Subject.create(name: "Biology") }
  let!(:course) { subject.courses.create(name: "Biology 101", subject: subject) }

  scenario 'empty entry' do
    visit subject_course_path(subject, course)
    click_button 'Create Homework'

    expect(page).to have_content("Unable to create homework")

    expect(Homework.count).to eq(0)
  end

  scenario 'valid entry' do
    visit subject_course_path(subject, course)

    within('.new-homework') do
      fill_in 'Entry', with: 'This is a homework entry'
    end
    click_button 'Create Homework'

    expect(page).to have_content("Homework was successfully created")

    expect(Homework.count).to eq(1)

    expect(Homework.last.entry).to eq('This is a homework entry')
  end
end