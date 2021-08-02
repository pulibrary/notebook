# frozen_string_literal: true

require "rails_helper"

RSpec.describe "destroy homework", js: true, type: :system do
  let!(:subject) { Subject.create(name: "Biology") }
  let!(:course) { subject.courses.create(name: "Biology 101", subject: subject) }

  describe "accept alert" do
    it "destroys homework" do
      course.homeworks.create(entry: "This is a homework", due_at: DateTime.now, course: course)
      visit subject_course_path(subject, course)

      expect do
        accept_alert "Are you sure?" do
          click_button "Destroy"
        end
        sleep 1.second
      end.to change(Homework, :count).by(-1)
    end
  end

  describe "dismiss alert" do
    it "does not destroy homework" do
      course.homeworks.create(entry: "This is a homework", due_at: DateTime.now, course: course)
      visit subject_course_path(subject, course)
      click_button "Destroy"

      alert = page.driver.browser.switch_to.alert
      alert.dismiss

      expect(Homework.count).to eq(1)
    end
  end
end
