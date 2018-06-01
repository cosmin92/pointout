require 'rails_helper'

RSpec.describe "reports/index", type: :view do
  before(:each) do
    signaler = create(:signaler)
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
end
