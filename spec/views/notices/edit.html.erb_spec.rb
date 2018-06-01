require 'rails_helper'

RSpec.describe "notices/edit", type: :view do
  before(:each) do
    group = create(:group)
    forwarder = create(:forwarder, :group => group)
    @notice = assign(:notice, create(:notice, :forwarder => forwarder, :group => group))
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
