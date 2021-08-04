# frozen_string_literal: true

require "rails_helper"

RSpec.describe "destroy subject", js: true, type: :system do
  let!(:user) { User.create(email: "user@test.com", password: "testpass") }

  before { login_as(user, scope: :user) }

  describe "accept alert" do
    it "destroys subject" do
      Subject.create(name: "Biology", user: user)
      visit subjects_path

      expect do
        accept_alert "Are you sure?" do
          click_button "Destroy"
        end
        sleep 1.second
      end.to change(Subject, :count).by(-1)
    end
  end

  describe "dismiss alert" do
    it "does not destroy subject" do
      Subject.create(name: "Biology", user: user)
      visit subjects_path
      click_button "Destroy"

      alert = page.driver.browser.switch_to.alert
      alert.dismiss

      expect(Subject.count).to eq(1)
    end
  end
end
