require 'rails_helper'

RSpec.describe "reports/show", type: :view do
  include Devise::Test::ControllerHelpers
  before(:each) do
    signaler = create(:signaler)
    sign_in signaler
    @report = assign(:report, create(:report, :object => "Object", :signaler => signaler))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Object/)
  end
  
end
