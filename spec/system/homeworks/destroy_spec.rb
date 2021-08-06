# frozen_string_literal: true

require "rails_helper"

RSpec.describe "destroy homework", js: true, type: :system do
  let(:user) { FactoryBot.create(:user) }
  let(:subject) { FactoryBot.create(:subject, user: user) }
  let(:course) { FactoryBot.create(:course, subject: subject) }
  let(:homework) { FactoryBot.create(:homework, course: course) }

  before { sign_in user }

  describe "accept alert" do
    it "destroys homework" do
      homework
      visit subject_course_path(subject, course)
      expect do
        accept_alert "Are you sure?" do
          click_button "Destroy"
        end
        sleep 1.second
      end.to change(Homework, :count).by(-1)
    end
  end

  describe "dismiss alert" do
    it "does not destroy homework" do
      homework
      visit subject_course_path(subject, course)
      click_button "Destroy"
      alert = page.driver.browser.switch_to.alert
      alert.dismiss
      expect(Homework.count).to eq(1)
    end
  end
end
