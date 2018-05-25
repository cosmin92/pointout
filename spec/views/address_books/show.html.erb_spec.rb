require 'rails_helper'

RSpec.describe "address_books/show", type: :view do
  before(:each) do
    @address_book = assign(:address_book, AddressBook.create!(
      :name => "Name",
      :note => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
  end
end
