require 'rails_helper'

RSpec.describe "homeworks/new", type: :view do
  before(:each) do
    assign(:homework, Homework.new(
      entry: "MyText"
    ))
  end

  it "renders new homework form" do
    render

    assert_select "form[action=?][method=?]", homeworks_path, "post" do

      assert_select "textarea[name=?]", "homework[entry]"
    end
  end
end
