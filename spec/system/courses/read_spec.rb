# frozen_string_literal: true

require "rails_helper"

RSpec.describe "read course", type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:subject) { FactoryBot.create(:subject, user: user) }
  let(:course) { FactoryBot.create(:course, subject: subject) }

  before { login_as(user, scope: :user) }

  it "displays name" do
    course
    visit subject_path(subject)
    expect(page).to have_content("Biology 101")
  end

  it "displays show button" do
    course
    visit subject_path(subject)
    expect(page).to have_button("Show")
  end

  it "displays edit button" do
    course
    visit subject_path(subject)
    expect(page).to have_button("Edit")
  end

  it "displays destroy button" do
    course
    visit subject_path(subject)
    expect(page).to have_button("Destroy")
  end
end
