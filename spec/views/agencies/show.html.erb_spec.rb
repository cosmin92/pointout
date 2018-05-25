require 'rails_helper'

RSpec.describe "agencies/show", type: :view do
  before(:each) do
    @agency = assign(:agency, Agency.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Fax/)
    expect(rendered).to match(/Street/)
    expect(rendered).to match(/Number/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Zip Code/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Web Site Url/)
  end
end
