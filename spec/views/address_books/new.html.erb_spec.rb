require 'rails_helper'

RSpec.describe "address_books/new", type: :view do
  before(:each) do
    assign(:address_book, AddressBook.new(
      :name => "MyString",
      :note => "MyText"
    ))
  end

  it "renders new address_book form" do
    render

    assert_select "form[action=?][method=?]", address_books_path, "post" do

      assert_select "input[name=?]", "address_book[name]"

      assert_select "textarea[name=?]", "address_book[note]"
    end
  end
end
