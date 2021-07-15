require 'rails_helper'

RSpec.describe "homeworks/index", type: :view do
  before(:each) do
    assign(:homeworks, [
      Homework.create!(
        entry: "MyText"
      ),
      Homework.create!(
        entry: "MyText"
      )
    ])
  end

  it "renders a list of homeworks" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
