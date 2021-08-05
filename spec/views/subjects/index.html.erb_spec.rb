# frozen_string_literal: true

require "rails_helper"

RSpec.describe "subjects/index", type: :view do
  before do
    user = FactoryBot.create(:user)
    sign_in user
    assign(:subjects, [
             Subject.create!(
               name: "Name", user: user
             ),
             Subject.create!(
               name: "Name", user: user
             )
           ])
  end

  it "renders a list of subjects" do
    render
    assert_select "div>h3", text: "Name".to_s, count: 2
  end
end
