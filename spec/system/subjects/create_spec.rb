require 'rails_helper'

RSpec.describe 'create subject', type: :system do
  scenario 'empty name' do
    visit subjects_path
    click_button 'Create Subject'

    expect(page).to have_content("Unable to create subject")

    expect(Subject.count).to eq(0)
  end

  scenario 'valid name' do
    visit subjects_path

    fill_in 'Name', with: 'Biology'
    click_button 'Create Subject'

    expect(page).to have_content("Subject was successfully created")

    expect(Subject.count).to eq(1)

    expect(Subject.last.name).to eq('Biology')
  end
end