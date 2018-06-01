require 'rails_helper'

RSpec.describe "agencies/edit", type: :view do
  before(:each) do
    @agency = assign(:agency, create(:agency))
  end

  it "renders the edit agency form" do
    render

    assert_select "form[action=?][method=?]", agency_path(@agency), "post" do

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
