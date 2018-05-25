require 'rails_helper'

RSpec.describe "address_books/edit", type: :view do
  before(:each) do
    @address_book = assign(:address_book, AddressBook.create!(
      :name => "MyString",
      :note => "MyText"
    ))
  end

  it "renders the edit address_book form" do
    render

    assert_select "form[action=?][method=?]", address_book_path(@address_book), "post" do

      assert_select "input[name=?]", "address_book[name]"

      assert_select "textarea[name=?]", "address_book[note]"
    end
  end
end
