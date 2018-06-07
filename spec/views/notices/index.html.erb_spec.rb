require 'rails_helper'

RSpec.describe "notices/index", type: :view do

  include Devise::Test::ControllerHelpers

  before(:each) do
    forwarder = create(:forwarder)
    sign_in forwarder
    notice1 = create(:notice, :forwarder => forwarder, :group => forwarder.group, :title => "Title 1")
    notice2 = create(:notice, :forwarder => forwarder, :group => forwarder.group, :title => "Title 2")
    assign(:notices, [notice1, notice2])
  end

  it "renders a list of notices" do
    render
    expect(rendered).to have_content("Title 1")
    expect(rendered).to have_content("Title 1")
  end

end
