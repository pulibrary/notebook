# frozen_string_literal: true

require "rails_helper"

RSpec.describe "update homework", type: :system do
  let(:user) { FactoryBot.create(:user) }
  let(:subject) { FactoryBot.create(:subject, user: user) }
  let(:course) { FactoryBot.create(:course, subject: subject) }
  let!(:homework) { FactoryBot.create(:homework, course: course) }

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
      expect(homework.reload.entry).to eq("Biology homework")
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
