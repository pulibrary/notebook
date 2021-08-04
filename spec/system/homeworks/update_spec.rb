# frozen_string_literal: true

require "rails_helper"

RSpec.describe "update homework", type: :system do
  let!(:user) { User.create(email: "user@test.com", password: "testpass") }
  let!(:subject) { Subject.create(name: "Biology", user: user) }
  let!(:course) { subject.courses.create(name: "Biology 101", subject: subject) }
  let!(:homework) { course.homeworks.create(entry: "This is a homework", due_at: DateTime.now, course: course) }

  before { login_as(user, scope: :user) }

  describe "with empty entry" do
    it "shows error message" do
      visit subject_course_path(subject, course)
      click_button "Edit"
      fill_in "Entry", with: ""
      click_button "Update Homework"
      expect(page).to have_content("Entry can't be blank")
    end

    it "does not update homework entry" do
      visit subject_course_path(subject, course)
      click_button "Edit"
      fill_in "Entry", with: ""
      click_button "Update Homework"
      expect(homework.reload.entry).to eq("This is a homework")
    end
  end

  describe "with valid entry" do
    it "displays success message" do
      visit subject_course_path(subject, course)
      click_button "Edit"
      fill_in "Entry", with: "Homework for Biology 101"
      click_button "Update Homework"
      expect(page).to have_content("Homework was successfully updated")
    end

    it "updates homework entry" do
      visit subject_course_path(subject, course)
      click_button "Edit"
      fill_in "Entry", with: "Homework for Biology 101"
      click_button "Update Homework"
      expect(homework.reload.entry).to eq("Homework for Biology 101")
    end
  end
end
