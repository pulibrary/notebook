require 'rails_helper'

RSpec.describe 'destroy note', js:true, type: :system do
  let!(:subject) { Subject.create(name: "Biology") }
  let!(:course) { subject.courses.create(name: "Biology 101", subject: subject) }
  let!(:note) { course.notes.create(entry: "This is a note", course: course) }

  scenario 'accept alert' do
    visit subject_course_path(subject, course)

    expect{
      accept_alert "Are you sure?" do
        click_button "Destroy"
      end
      sleep 1.second
    }.to change(Note, :count).by(-1)
  end

  scenario 'cancel alert' do
    visit subject_course_path(subject, course)

    click_button 'Destroy'

    alert = page.driver.browser.switch_to.alert
    alert.dismiss

    expect(Note.count).to eq(1)
  end

end