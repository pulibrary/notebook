# frozen_string_literal: true

require "rails_helper"

RSpec.describe "read note", type: :system do
  let(:user) { FactoryBot.create(:user) }
  let(:subject) { FactoryBot.create(:subject, user: user) }
  let(:course) { FactoryBot.create(:course, subject: subject) }
  let(:note) { FactoryBot.create(:note, course: course) }

  before { login_as(user, scope: :user) }

  it "displays entry" do
    note
    visit subject_course_path(subject, course)
    expect(page).to have_content("Biology note")
  end

  it "displays edit button" do
    note
    visit subject_course_path(subject, course)
    expect(page).to have_button("Edit")
  end

  it "displays destroy button" do
    note
    visit subject_course_path(subject, course)
    expect(page).to have_button("Destroy")
  end
end
