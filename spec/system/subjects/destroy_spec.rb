require 'rails_helper'

RSpec.describe 'destroy subject', js:true, type: :system do
  let!(:subject) { Subject.create(name: "Biology") }

  scenario 'accept alert' do
    visit subjects_path

    expect{
      accept_alert "Are you sure?" do
        click_button "Destroy"
      end
      sleep 1.second
    }.to change(Subject, :count).by(-1)
  end

  scenario 'cancel alert' do
    visit subjects_path

    click_button 'Destroy'

    alert = page.driver.browser.switch_to.alert
    alert.dismiss

    expect(Subject.count).to eq(1)
  end

end