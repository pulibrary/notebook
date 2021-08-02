require 'rails_helper'

RSpec.describe 'destroy course', js:true, type: :system do
  let!(:subject) { Subject.create(name: "Biology") }
  let!(:course) { subject.courses.create(name: "Biology 101", subject: subject) }

  scenario 'accept alert' do
    visit subject_path(subject)

    expect{
      accept_alert "Are you sure?" do
        click_button "Destroy"
      end
      sleep 1.second
    }.to change(Course, :count).by(-1)
  end

  scenario 'cancel alert' do
    visit subject_path(subject)

    click_button 'Destroy'

    alert = page.driver.browser.switch_to.alert
    alert.dismiss

    expect(Course.count).to eq(1)
  end

end