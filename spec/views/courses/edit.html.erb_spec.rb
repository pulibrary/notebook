# frozen_string_literal: true

require "rails_helper"

RSpec.describe "courses/edit", type: :view do
  before do
    user = FactoryBot.create(:user)
    login_as(user, scope: :user)
  end

  let!(:subject) do
    Subject.create!(name: "SubjectName")
  end
  let!(:course) do
    subject.courses.create!(name: "MyString")
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
