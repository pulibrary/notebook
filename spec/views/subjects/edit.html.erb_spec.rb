# frozen_string_literal: true

require "rails_helper"

RSpec.describe "subjects/edit", type: :view do
  before do
    user = FactoryBot.create(:user)
    login_as(user, scope: :user)
  end

  let!(:subject) do
    Subject.create!(name: "SubjectName")
  end

  it "renders the edit subject form" do
    assign(:subject, subject)
    render
    assert_select "form[action=?][method=?]", subject_path(subject), "post" do
      assert_select "input[name=?]", "subject[name]"
    end
  end
end
