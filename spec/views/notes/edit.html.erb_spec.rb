# frozen_string_literal: true

require "rails_helper"

RSpec.describe "notes/edit", type: :view do
  let(:subject) { FactoryBot.create(:subject) }
  let(:course) { FactoryBot.create(:course) }
  let(:note) { FactoryBot.create(:note) }

  before do
    user = FactoryBot.create(:user)
    sign_in user
  end

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
