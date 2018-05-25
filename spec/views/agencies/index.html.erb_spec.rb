require 'rails_helper'

RSpec.describe "agencies/index", type: :view do
  before(:each) do
    assign(:agencies, [
      Agency.create!(
        :name => "Name",
        :phone => "Phone",
        :email => "Email",
        :fax => "Fax",
        :street => "Street",
        :number => "Number",
        :city => "City",
        :zip_code => "Zip Code",
        :note => "MyText",
        :web_site_url => "Web Site Url"
      ),
      Agency.create!(
        :name => "Name",
        :phone => "Phone",
        :email => "Email",
        :fax => "Fax",
        :street => "Street",
        :number => "Number",
        :city => "City",
        :zip_code => "Zip Code",
        :note => "MyText",
        :web_site_url => "Web Site Url"
      )
    ])
  end

  it "renders a list of agencies" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Fax".to_s, :count => 2
    assert_select "tr>td", :text => "Street".to_s, :count => 2
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Zip Code".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Web Site Url".to_s, :count => 2
  end
end
