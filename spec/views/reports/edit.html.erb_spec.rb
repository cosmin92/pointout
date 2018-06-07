require 'rails_helper'

RSpec.describe "reports/edit", type: :view do

  include Devise::Test::ControllerHelpers

  before(:each) do
    signaler = create(:signaler)
    sign_in signaler
    tipology = create(:tipology)
    @report = assign(:report, create(:report, :signaler => signaler, :tipology => tipology))
  end

  it "renders the edit report form" do
    render

    assert_select "form[action=?][method=?]", report_path(@report), "post" do

      assert_select "input[name=?]", "report[object]"

      assert_select "textarea[name=?]", "report[description]"

      assert_select "input[name=?]", "report[images][]"

      assert_select "input[name=?]", "report[address]"

      assert_select "input[name=?]", "report[longitude]"

      assert_select "input[name=?]", "report[latitude]"

      assert_select "input[name=?]", "report[report_type]"

      assert_select "input[name=?]", "report[intervention_type]"
    end
  end
end
