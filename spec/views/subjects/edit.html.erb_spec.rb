# frozen_string_literal: true

require "rails_helper"

RSpec.describe "subjects/edit", type: :view do
  let!(:user) { User.create(email: "user@test.com", password: "testpass") }
  let!(:subject) { Subject.create!(name: "SubjectName", user: user) }

  before { login_as(user, scope: :user) }

  it "renders the edit subject form" do
    assign(:subject, subject)
    render
    assert_select "form[action=?][method=?]", subject_path(subject), "post" do
      assert_select "input[name=?]", "subject[name]"
    end
  end
end
