# frozen_string_literal: true

require "rails_helper"

RSpec.describe "update note", type: :system do
  let!(:subject) { Subject.create(name: "Biology") }
  let!(:course) { subject.courses.create(name: "Biology 101", subject: subject) }
  let!(:note) { course.notes.create(entry: "This is a note", course: course) }

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
      expect(note.reload.entry).to eq("This is a note")
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
