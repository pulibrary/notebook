# frozen_string_literal: true

require "rails_helper"

RSpec.describe "destroy note", js: true, type: :system do
  let(:user) { FactoryBot.create(:user) }
  let(:subject) { FactoryBot.create(:subject, user: user) }
  let(:course) { FactoryBot.create(:course, subject: subject) }
  let(:note) { FactoryBot.create(:note, course: course) }

  before { sign_in user }

  describe "accept alert" do
    it "destroys note" do
      note
      visit subject_course_path(subject, course)
      expect do
        accept_alert "Are you sure?" do
          click_button "Destroy"
        end
        sleep 1.second
      end.to change(Note, :count).by(-1)
    end
  end

  describe "dismiss alert" do
    it "does not destroy note" do
      note
      visit subject_course_path(subject, course)
      click_button "Destroy"
      alert = page.driver.browser.switch_to.alert
      alert.dismiss
      expect(Note.count).to eq(1)
    end
  end
end
