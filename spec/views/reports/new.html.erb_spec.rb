require 'rails_helper'

RSpec.describe "reports/new", type: :view do

  include Devise::Test::ControllerHelpers

  before(:each) do
    sign_in create(:forwarder)
    assign(:report, Report.new)
  end

  it "renders new report form" do
    render

    assert_select "form[action=?][method=?]", reports_path, "post" do

      assert_select "input[name=?]", "report[object]"

      assert_select "textarea[name=?]", "report[description]"

      assert_select "input[name=?]", "report[address]"

      assert_select "input[name=?]", "report[longitude]"

      assert_select "input[name=?]", "report[latitude]"

      assert_select "input[name=?]", "report[report_type]"

      assert_select "input[name=?]", "report[intervention_type]"

      assert_select "input[name=?]", "report[images][]"
    end
  end
end
