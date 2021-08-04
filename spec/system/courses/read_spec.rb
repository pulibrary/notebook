# frozen_string_literal: true

require "rails_helper"

RSpec.describe "read course", type: :system do
  before do
    user = FactoryBot.create(:user)
    login_as(user, scope: :user)
  end

  let!(:subject) { Subject.create(name: "Biology") }

  it "displays name" do
    subject.courses.create(name: "Biology 101", subject: subject)
    visit subject_path(subject)

    expect(page).to have_content("Biology 101")
  end

  it "displays show button" do
    subject.courses.create(name: "Biology 101", subject: subject)
    visit subject_path(subject)

    expect(page).to have_button("Show")
  end

  it "displays edit button" do
    subject.courses.create(name: "Biology 101", subject: subject)
    visit subject_path(subject)

    expect(page).to have_button("Edit")
  end

  it "displays destroy button" do
    subject.courses.create(name: "Biology 101", subject: subject)
    visit subject_path(subject)

    expect(page).to have_button("Destroy")
  end
end
