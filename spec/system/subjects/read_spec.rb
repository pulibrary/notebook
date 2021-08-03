# frozen_string_literal: true

require "rails_helper"

RSpec.describe "read subject", type: :system do
  it "displays name" do
    Subject.create(name: "Biology")
    visit subjects_path

    expect(page).to have_content("Biology")
  end

  it "displays show button" do
    Subject.create(name: "Biology")
    visit subjects_path

    expect(page).to have_button("Show")
  end

  it "displays edit button" do
    Subject.create(name: "Biology")
    visit subjects_path

    expect(page).to have_button("Edit")
  end

  it "displays destroy button" do
    Subject.create(name: "Biology")
    visit subjects_path

    expect(page).to have_button("Destroy")
  end
end
