# frozen_string_literal: true

require "rails_helper"

RSpec.describe "courses/edit", type: :view do
  let(:subject) { FactoryBot.create(:subject) }
  let(:course) { FactoryBot.create(:course) }

  before do
    user = FactoryBot.create(:user)
    sign_in user
  end

  it "renders the edit course form" do
    assign(:subject, subject)
    assign(:course, course)
    render
    assert_select "form[action=?][method=?]", subject_course_path(subject, course), "post" do
      assert_select "input[name=?]", "course[name]"
    end
  end
end
