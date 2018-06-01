require 'rails_helper'

RSpec.describe "agencies/index", type: :view do
  before(:each) do
    forwarder = create(:forwarder)
    agency1 = create(:agency, :name => "Agency 1", :forwarder => forwarder)
    agency2 = create(:agency, :name => "Agency 2", :forwarder => forwarder)
    assign(:agencies, [ agency1, agency2 ])
  end

  it "renders a list of agencies" do
    render
    expect(rendered).to have_content("Agency 1")
    expect(rendered).to have_content("Agency 2")
  end
end
