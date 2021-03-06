# frozen_string_literal: true

require "rails_helper"

RSpec.describe "update subject", type: :system do
  let(:user) { FactoryBot.create(:user) }
  let!(:subject) { FactoryBot.create(:subject, user: user) }

  before { sign_in user }

  describe "with empty name" do
    it "shows error message" do
      visit subjects_path
      click_button "Edit"
      fill_in "Name", with: ""
      click_button "Update Subject"
      expect(page).to have_content("Name can't be blank")
    end

    it "does not update subject name" do
      visit subjects_path
      click_button "Edit"
      fill_in "Name", with: ""
      click_button "Update Subject"
      expect(subject.reload.name).to eq("Biology")
    end
  end

  describe "with valid name" do
    it "displays success message" do
      visit subjects_path
      click_button "Edit"
      fill_in "Name", with: "Criminology"
      click_button "Update Subject"
      expect(page).to have_content("Subject was successfully updated")
    end

    it "updates subject name" do
      visit subjects_path
      click_button "Edit"
      fill_in "Name", with: "Criminology"
      click_button "Update Subject"
      expect(subject.reload.name).to eq("Criminology")
    end
  end
end
