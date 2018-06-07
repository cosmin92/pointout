require 'rails_helper'

RSpec.describe "notices/show", type: :view do

  include Devise::Test::ControllerHelpers

  before(:each) do
    forwarder = create(:forwarder)
    sign_in forwarder
    @notice = assign(:notice, create(:notice, :title => "Title", :content => "a" * 50, :forwarder => forwarder, :group => forwarder.group))
  end

  it "renders title" do
    render
    expect(rendered).to match(/Title/)
  end

  it "renders content" do
    render
    content = "a" * 50
    expect(rendered).to match(/content/)
  end
end
