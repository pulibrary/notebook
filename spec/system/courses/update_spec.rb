# frozen_string_literal: true

require "rails_helper"

RSpec.describe "update course", type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:subject) { FactoryBot.create(:subject, user: user) }
  let!(:course) { FactoryBot.create(:course, subject: subject) }

  before { login_as(user, scope: :user) }

  describe "with empty name" do
    it "shows error message" do
      visit subject_path(subject)
      click_button "Edit"
      fill_in "Name", with: ""
      click_button "Update Course"
      expect(page).to have_content("Name can't be blank")
    end

    it "does not update course name" do
      visit subject_path(subject)
      click_button "Edit"
      fill_in "Name", with: ""
      click_button "Update Course"
      expect(course.reload.name).to eq("Biology 101")
    end
  end

  describe "with valid name" do
    it "displays success message" do
      visit subject_path(subject)
      click_button "Edit"
      fill_in "Name", with: "Biology 102"
      click_button "Update Course"
      expect(page).to have_content("Course was successfully updated")
    end

    it "updates course name" do
      visit subject_path(subject)
      click_button "Edit"
      fill_in "Name", with: "Biology 102"
      click_button "Update Course"
      expect(course.reload.name).to eq("Biology 102")
    end
  end
end
