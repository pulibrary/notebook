# frozen_string_literal: true

require "rails_helper"

RSpec.describe "subjects/index", type: :view do
  before do
    user = FactoryBot.create(:user)
    login_as(user, scope: :user)
    assign(:subjects, [
             Subject.create!(
               name: "Name"
             ),
             Subject.create!(
               name: "Name"
             )
           ])
  end

  it "renders a list of subjects" do
    render
    assert_select "div>h3", text: "Name".to_s, count: 2
  end
end
