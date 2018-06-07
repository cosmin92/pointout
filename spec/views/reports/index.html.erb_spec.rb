require 'rails_helper'

RSpec.describe "reports/index", type: :view do

  include Devise::Test::ControllerHelpers

  before(:each) do
    signaler = create(:signaler)
    sign_in signaler
    tipology = create(:tipology)
    report1 = create(:report, :signaler => signaler, :tipology => tipology, :object => "Object 1")
    report2 = create(:report, :signaler => signaler, :tipology => tipology, :object => "Object 2")
    assign(:reports, [report1, report2])
  end

  it "renders a list of reports" do
    render
    expect(rendered).to have_content("Object 1")
    expect(rendered).to have_content("Object 2")
  end

  it "renders s<earch form" do
    render

    assert_select "form[action=?][method=?]", reports_path, "get" do

      assert_select "input[name=?]", "search[address]"
      assert_select "input[name=?]", "search[radius]"
      assert_select "input[name=?]", "search[longitude]"
      assert_select "input[name=?]", "search[latitude]"
      assert_select "select[name=?]", "search[unit]"
      assert_select "select[name=?]", "search[tipology_id]"
      assert_select "select[name=?]", "search[creation_date]"
      assert_select "select[name=?]", "search[object]"

    end
  end
end
