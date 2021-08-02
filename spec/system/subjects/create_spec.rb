# frozen_string_literal: true

require "rails_helper"

RSpec.describe "create subject", type: :system do
  describe "with empty name" do
    it "does note create a new subject" do
      visit subjects_path
      click_button "Create Subject"

      expect(Subject.count).to eq(0)
    end

    it "displays an error message" do
      visit subjects_path
      click_button "Create Subject"

      expect(page).to have_content("Unable to create subject")
    end
  end

  describe "with valid name" do
    it "creates a new subject" do
      visit subjects_path
      fill_in "Name", with: "Biology"
      click_button "Create Subject"

      expect(Subject.count).to eq(1)
    end

    it "displays a success message" do
      visit subjects_path
      fill_in "Name", with: "Biology"
      click_button "Create Subject"

      expect(page).to have_content("Subject was successfully created")
    end
  end
end
