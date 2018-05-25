require 'rails_helper'

RSpec.describe "notices/edit", type: :view do
  before(:each) do
    @notice = assign(:notice, Notice.create!(
      :title => "MyString",
      :content => "MyText",
      :notice_type => "MyString"
    ))
  end

  it "renders the edit notice form" do
    render

    assert_select "form[action=?][method=?]", notice_path(@notice), "post" do

      assert_select "input[name=?]", "notice[title]"

      assert_select "textarea[name=?]", "notice[content]"

      assert_select "input[name=?]", "notice[notice_type]"
    end
  end
end
