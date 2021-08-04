# frozen_string_literal: true

require "rails_helper"

RSpec.describe "notes/edit", type: :view do
  let!(:user) { User.create(email: "user@test.com", password: "testpass") }
  let!(:subject) { Subject.create!(name: "SubjectName", user: user) }
  let!(:course) { subject.courses.create!(name: "CourseName") }
  let!(:note) { course.notes.create!(entry: "MyText") }

  before { login_as(user, scope: :user) }

  it "renders the edit note form" do
    assign(:subject, subject)
    assign(:course, course)
    assign(:note, note)
    render
    assert_select "form[action=?][method=?]", subject_course_note_path(subject, course, note), "post" do
      assert_select "textarea[name=?]", "note[entry]"
    end
  end
end
