# frozen_string_literal: true

require "rails_helper"

RSpec.describe "homeworks/edit", type: :view do
  let(:user) { FactoryBot.create(:user) }
  let(:subject) { FactoryBot.create(:subject) }
  let(:course) { FactoryBot.create(:course) }
  let(:homework) { FactoryBot.create(:homework) }

  before { login_as(user, scope: :user) }

  it "renders the edit homework form" do
    assign(:subject, subject)
    assign(:course, course)
    assign(:homework, homework)
    render
    assert_select "form[action=?][method=?]", subject_course_homework_path(subject, course, homework), "post" do
      assert_select "textarea[name=?]", "homework[entry]"
    end
  end
end
