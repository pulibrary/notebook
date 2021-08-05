# frozen_string_literal: true

require "rails_helper"

RSpec.describe "read homework", type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:subject) { FactoryBot.create(:subject, user: user) }
  let!(:course) { FactoryBot.create(:course, subject: subject) }
  let(:homework) { FactoryBot.create(:homework, course: course) }

  before { login_as(user, scope: :user) }

  it "displays entry" do
    homework
    visit subject_course_path(subject, course)
    expect(page).to have_content("Biology homework")
  end

  it "displays due date" do
    homework
    visit subject_course_path(subject, course)
    expect(page).to have_content("Due on: Mon, 02 Aug 2021")
  end

  it "displays edit button" do
    homework
    visit subject_course_path(subject, course)
    expect(page).to have_button("Edit")
  end

  it "displays destroy button" do
    homework
    visit subject_course_path(subject, course)
    expect(page).to have_button("Destroy")
  end
end
