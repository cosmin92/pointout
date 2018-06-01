require 'rails_helper'

RSpec.describe "notices/show", type: :view do
  before(:each) do
    @notice = assign(:notice, create(:notice, :title => "Title"))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
  end
end
