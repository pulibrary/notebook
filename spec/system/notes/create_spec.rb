# frozen_string_literal: true

require "rails_helper"

RSpec.describe "create note", type: :system do
  let(:user) { FactoryBot.create(:user) }
  let(:subject) { FactoryBot.create(:subject, user: user) }
  let(:course) { FactoryBot.create(:course, subject: subject) }

  before { sign_in user }

  describe "with empty entry" do
    it "does note create a new note" do
      visit subject_course_path(subject, course)
      click_button "Create Note"
      expect(Note.count).to eq(0)
    end

    it "displays an error message" do
      visit subject_course_path(subject, course)
      click_button "Create Note"
      expect(page).to have_content("Unable to create note")
    end
  end

  describe "with valid entry" do
    it "creates a new note" do
      visit subject_course_path(subject, course)
      within(".new-note") do
        fill_in "Entry", with: "This is a note entry"
      end
      click_button "Create Note"
      expect(Note.count).to eq(1)
    end

    it "displays a success message" do
      visit subject_course_path(subject, course)
      within(".new-note") do
        fill_in "Entry", with: "This is a note entry"
      end
      click_button "Create Note"
      expect(page).to have_content("Note was successfully created")
    end
  end
end
