# frozen_string_literal: true

require "rails_helper"

RSpec.describe "create course", type: :system do
  let(:user) { FactoryBot.create(:user) }
  let(:subject) { FactoryBot.create(:subject, user: user) }

  before { sign_in user }

  describe "with empty name" do
    it "does not create a new course" do
      visit subject_path(subject)
      click_button "Create Course"
      expect(Course.count).to eq(0)
    end

    it "displays an error message" do
      visit subject_path(subject)
      click_button "Create Course"
      expect(page).to have_content("Unable to create course")
    end
  end

  describe "with valid name" do
    it "creates a new course" do
      visit subject_path(subject)
      fill_in "Name", with: "Biology 101"
      click_button "Create Course"
      expect(Course.count).to eq(1)
    end

    it "displays a success message" do
      visit subject_path(subject)
      fill_in "Name", with: "Biology 101"
      click_button "Create Course"
      expect(page).to have_content("Course was successfully created")
    end
  end
end
