require 'rails_helper'

RSpec.describe "reports/show", type: :view do
  before(:each) do
    @report = assign(:report, Report.create!(
      :object => "Object",
      :description => "MyText",
      :images => "Images",
      :address => "Address",
      :longitude => "9.99",
      :latitude => "9.99",
      :report_type => "Report Type",
      :intervention_type => false,
      :state => "State"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Object/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Images/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Report Type/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/State/)
  end
end
