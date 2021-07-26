# frozen_string_literal: true

require "rails_helper"

RSpec.describe "subjects/show", type: :view do
  let!(:subject) do
    Subject.create!(name: "SubjectName")
  end

  it "renders attributes in <p>" do
    assign(:subject, subject)
    render
    expect(rendered).to match(/Name/)
  end
end
