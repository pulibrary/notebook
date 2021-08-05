# frozen_string_literal: true

require "rails_helper"

RSpec.describe "destroy course", js: true, type: :system do
  let(:user) { FactoryBot.create(:user) }
  let(:subject) { FactoryBot.create(:subject, user: user) }
  let(:course) { FactoryBot.create(:course, subject: subject) }

  before { login_as(user, scope: :user) }

  describe "accept alert" do
    it "destroys course" do
      course
      visit subject_path(subject)
      expect do
        accept_alert "Are you sure?" do
          click_button "Destroy"
        end
        sleep 1.second
      end.to change(Course, :count).by(-1)
    end
  end

  describe "dismiss alert" do
    it "does not destroy course" do
      course
      visit subject_path(subject)
      click_button "Destroy"
      alert = page.driver.browser.switch_to.alert
      alert.dismiss
      expect(Course.count).to eq(1)
    end
  end
end
