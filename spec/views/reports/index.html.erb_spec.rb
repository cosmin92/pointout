require 'rails_helper'

RSpec.describe "reports/index", type: :view do
  before(:each) do
    assign(:reports, [
      Report.create!(
        :object => "Object",
        :description => "MyText",
        :images => "Images",
        :address => "Address",
        :longitude => "9.99",
        :latitude => "9.99",
        :report_type => "Report Type",
        :intervention_type => false,
        :state => "State"
      ),
      Report.create!(
        :object => "Object",
        :description => "MyText",
        :images => "Images",
        :address => "Address",
        :longitude => "9.99",
        :latitude => "9.99",
        :report_type => "Report Type",
        :intervention_type => false,
        :state => "State"
      )
    ])
  end

  it "renders a list of reports" do
    render
    assert_select "tr>td", :text => "Object".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Images".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Report Type".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
  end
end
