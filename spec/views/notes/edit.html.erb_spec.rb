# frozen_string_literal: true

require "rails_helper"

RSpec.describe "notes/edit", type: :view do
  let(:user) { FactoryBot.create(:user) }
  let(:subject) { FactoryBot.create(:subject) }
  let(:course) { FactoryBot.create(:course) }
  let(:note) { FactoryBot.create(:note) }

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
