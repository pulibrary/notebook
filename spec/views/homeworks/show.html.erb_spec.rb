require 'rails_helper'

RSpec.describe "homeworks/show", type: :view do
  before(:each) do
    @homework = assign(:homework, Homework.create!(
      entry: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
  end
end
