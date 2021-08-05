# frozen_string_literal: true

require "rails_helper"

RSpec.describe "update note", type: :system do
  let(:user) { FactoryBot.create(:user) }
  let(:subject) { FactoryBot.create(:subject, user: user) }
  let(:course) { FactoryBot.create(:course, subject: subject) }
  let!(:note) { FactoryBot.create(:note, course: course) }

  before { sign_in user }

  describe "with empty entry" do
    it "shows error message" do
      visit subject_course_path(subject, course)
      click_button "Edit"
      fill_in "Entry", with: ""
      click_button "Update Note"
      expect(page).to have_content("Entry can't be blank")
    end

    it "does not update note entry" do
      visit subject_course_path(subject, course)
      click_button "Edit"
      fill_in "Entry", with: ""
      click_button "Update Note"
      expect(note.reload.entry).to eq("Biology note")
    end
  end

  describe "with valid entry" do
    it "displays success message" do
      visit subject_course_path(subject, course)
      click_button "Edit"
      fill_in "Entry", with: "Note for Biology 101"
      click_button "Update Note"
      expect(page).to have_content("Note was successfully updated")
    end

    it "updates note entry" do
      visit subject_course_path(subject, course)
      click_button "Edit"
      fill_in "Entry", with: "Note for Biology 101"
      click_button "Update Note"
      expect(note.reload.entry).to eq("Note for Biology 101")
    end
  end
end
