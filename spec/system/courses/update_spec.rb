# frozen_string_literal: true

require "rails_helper"

RSpec.describe "update course", type: :system do
  before do
    user = FactoryBot.create(:user)
    login_as(user, scope: :user)
  end

  let!(:subject) { Subject.create(name: "Biology") }
  let!(:course) { subject.courses.create(name: "Biology 101", subject: subject) }

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
