require 'rails_helper'

RSpec.describe "notices/new", type: :view do
  before(:each) do
    assign(:notice, Notice.new)
  end

  it "renders new notice form" do
    render

    assert_select "form[action=?][method=?]", notices_path, "post" do

      assert_select "input[name=?]", "notice[title]"

      assert_select "textarea[name=?]", "notice[content]"

      assert_select "input[name=?]", "notice[notice_type]"
    end
  end
end
