require 'rails_helper'

RSpec.describe 'create course', type: :system do
  let!(:subject) { Subject.create(name: "Biology") }

  scenario 'empty name' do
    visit subject_path(subject)
    click_button 'Create Course'

    expect(page).to have_content("Unable to create course")

    expect(Course.count).to eq(0)
  end

  scenario 'valid name' do
    visit subject_path(subject)

    fill_in 'Name', with: 'Biology 101'
    click_button 'Create Course'

    expect(page).to have_content("Course was successfully created")

    expect(Course.count).to eq(1)

    expect(Course.last.name).to eq('Biology 101')
  end
end