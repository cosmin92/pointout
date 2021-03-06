require 'rails_helper'

RSpec.describe "agencies/new", type: :view do

  include Devise::Test::ControllerHelpers

  before(:each) do
    sign_in create(:forwarder)
    assign(:agency, Agency.new)
  end

  it "renders new agency form" do
    render

    assert_select "form[action=?][method=?]", agencies_path, "post" do
      assert_select "input[name=?]", "agency[name]"
      assert_select "input[name=?]", "agency[phone]"
      assert_select "input[name=?]", "agency[email]"
      assert_select "input[name=?]", "agency[fax]"
      assert_select "input[name=?]", "agency[street]"
      assert_select "input[name=?]", "agency[number]"
      assert_select "input[name=?]", "agency[city]"
      assert_select "input[name=?]", "agency[zip_code]"
      assert_select "textarea[name=?]", "agency[note]"
      assert_select "input[name=?]", "agency[web_site_url]"
    end

  end

end
