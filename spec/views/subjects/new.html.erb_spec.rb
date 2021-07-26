# frozen_string_literal: true

require "rails_helper"

RSpec.describe "subjects/new", type: :view do
  before do
    assign(:subject, Subject.new(
                       name: "MyString"
                     ))
  end

  it "renders new subject form" do
    render

    assert_select "form[action=?][method=?]", subjects_path, "post" do
      assert_select "input[name=?]", "subject[name]"
    end
  end
end
