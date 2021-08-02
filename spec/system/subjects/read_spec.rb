require 'rails_helper'

RSpec.describe 'read subject', type: :system do
  let!(:subject) { Subject.create(name: "Biology") }

  scenario 'name exists' do
    visit subjects_path

    expect(page).to have_content("Biology")
  end

  scenario 'show button exists' do
    visit subjects_path

    expect(page).to have_button("Show")
  end

  scenario 'edit button exists' do
    visit subjects_path

    expect(page).to have_button("Edit")
  end
  
  scenario 'destroy button exists' do
    visit subjects_path

    expect(page).to have_button("Destroy")
  end
end