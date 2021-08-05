# frozen_string_literal: true

require "rails_helper"

RSpec.describe "read subject", type: :system do
  let(:user) { FactoryBot.create(:user) }
  let(:subject) { FactoryBot.create(:subject, user: user) }

  before { sign_in user }

  it "displays name" do
    subject
    visit subjects_path
    expect(page).to have_content("Biology")
  end

  it "displays show button" do
    subject
    visit subjects_path
    expect(page).to have_button("Show")
  end

  it "displays edit button" do
    subject
    visit subjects_path
    expect(page).to have_button("Edit")
  end

  it "displays destroy button" do
    subject
    visit subjects_path
    expect(page).to have_button("Destroy")
  end
end
