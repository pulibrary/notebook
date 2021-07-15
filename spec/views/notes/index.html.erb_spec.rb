require 'rails_helper'

RSpec.describe "notes/index", type: :view do
  before(:each) do
    assign(:notes, [
      Note.create!(
        entry: "MyText"
      ),
      Note.create!(
        entry: "MyText"
      )
    ])
  end

  it "renders a list of notes" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
