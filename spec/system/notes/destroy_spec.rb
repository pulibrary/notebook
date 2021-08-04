# frozen_string_literal: true

require "rails_helper"

RSpec.describe "destroy note", js: true, type: :system do
  before do
    user = FactoryBot.create(:user)
    login_as(user, scope: :user)
  end

  let!(:subject) { Subject.create(name: "Biology") }
  let!(:course) { subject.courses.create(name: "Biology 101", subject: subject) }

  describe "accept alert" do
    it "destroys note" do
      course.notes.create(entry: "This is a note", course: course)
      visit subject_course_path(subject, course)

      expect do
        accept_alert "Are you sure?" do
          click_button "Destroy"
        end
        sleep 1.second
      end.to change(Note, :count).by(-1)
    end
  end

  describe "dismiss alert" do
    it "does not destroy note" do
      course.notes.create(entry: "This is a note", course: course)
      visit subject_course_path(subject, course)
      click_button "Destroy"

      alert = page.driver.browser.switch_to.alert
      alert.dismiss

      expect(Note.count).to eq(1)
    end
  end
end
