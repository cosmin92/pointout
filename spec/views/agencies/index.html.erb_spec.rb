require 'rails_helper'

RSpec.describe "agencies/index", type: :view do

  include Devise::Test::ControllerHelpers

  before(:each) do
    forwarder = create(:forwarder)
    sign_in forwarder
    agency1 = create(:agency, :name => "Agency 1", :email => "agency1@gmail.com", :forwarder => forwarder)
    agency2 = create(:agency, :name => "Agency 2", :email => "agency2@gmail.com", :forwarder => forwarder)
    assign(:agencies, [agency1, agency2])
  end

  it "renders a list of agencies name" do
    render
    expect(rendered).to have_content("Agency 1")
    expect(rendered).to have_content("Agency 2")
  end

  it "renders a list of agencies email" do
    render
    expect(rendered).to have_content("agency1@gmail.com")
    expect(rendered).to have_content("agency2@gmail.com")
  end

end
