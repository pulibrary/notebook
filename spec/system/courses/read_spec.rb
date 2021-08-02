require 'rails_helper'

RSpec.describe 'read course', type: :system do
  let!(:subject) { Subject.create(name: "Biology") }
  let!(:course) { subject.courses.create(name: "Biology 101", subject: subject) }

  scenario 'name exists' do
    visit subject_path(subject)

    expect(page).to have_content("Biology 101")
  end

  scenario 'show button exists' do
    visit subject_path(subject)

    expect(page).to have_button("Show")
  end

  scenario 'edit button exists' do
    visit subject_path(subject)

    expect(page).to have_button("Edit")
  end

  scenario 'destroy button exists' do
    visit subject_path(subject)

    expect(page).to have_button("Destroy")
  end
end