require 'rails_helper'

RSpec.describe "address_books/index", type: :view do

  include Devise::Test::ControllerHelpers

  before(:each) do
    forwarder = create(:forwarder)
    sign_in forwarder
    address_book1 = create(:address_book, :name => "Address Book 1", :note => "a" * 50, :forwarder => forwarder, :group => forwarder.group)
    address_book2 = create(:address_book, :name => "Address Book 2", :note => "b" * 50, :forwarder => forwarder, :group => forwarder.group)
    assign(:address_books, [address_book1, address_book2])
  end

  it "renders a list of address_books title" do
    render
    expect(rendered).to have_content("Address Book 1")
    expect(rendered).to have_content("Address Book 2")
  end

  it "renders a list of address_books note" do
    render
    expect(rendered).to have_content("a" * 50)
    expect(rendered).to have_content("b" * 50)
  end

end
