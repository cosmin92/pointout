require 'rails_helper'

RSpec.describe "agencies/show", type: :view do
  before(:each) do
    @agency = assign(:agency, create(:agency, :name => "Agency name" ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Agency name/)
  end
end
