require 'rails_helper'

RSpec.describe "address_books/index", type: :view do
  before(:each) do
    assign(:address_books, [
      AddressBook.create!(
        :name => "Name",
        :note => "MyText"
      ),
      AddressBook.create!(
        :name => "Name",
        :note => "MyText"
      )
    ])
  end

  it "renders a list of address_books" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
