require 'rails_helper'

RSpec.describe "reports/new", type: :view do
  before(:each) do
    assign(:report, Report.new(
      :object => "MyString",
      :description => "MyText",
      :images => "MyString",
      :address => "MyString",
      :longitude => "9.99",
      :latitude => "9.99",
      :report_type => "MyString",
      :intervention_type => false,
      :state => "MyString"
    ))
  end

  it "renders new report form" do
    render

    assert_select "form[action=?][method=?]", reports_path, "post" do

      assert_select "input[name=?]", "report[object]"

      assert_select "textarea[name=?]", "report[description]"

      assert_select "input[name=?]", "report[images]"

      assert_select "input[name=?]", "report[address]"

      assert_select "input[name=?]", "report[longitude]"

      assert_select "input[name=?]", "report[latitude]"

      assert_select "input[name=?]", "report[report_type]"

      assert_select "input[name=?]", "report[intervention_type]"

      assert_select "input[name=?]", "report[state]"
    end
  end
end
