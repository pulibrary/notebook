# frozen_string_literal: true

require "rails_helper"

RSpec.describe "read course", type: :system do
  let!(:user) { User.create(email: "user@test.com", password: "testpass") }
  let!(:subject) { Subject.create(name: "Biology", user: user) }

  before { login_as(user, scope: :user) }

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
