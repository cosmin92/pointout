require 'rails_helper'

RSpec.describe "address_books/edit", type: :view do

  include Devise::Test::ControllerHelpers

  before(:each) do
    forwarder = create(:forwarder, :boss => true)
    sign_in forwarder
    address_book = create(:address_book, :name => "Name1", :forwarder => forwarder, :group => forwarder.group)
    @address_book = assign(:address_book, address_book)
  end

  it "renders the edit address_book form" do
    render

    assert_select "form[action=?][method=?]", address_book_path(@address_book), "post" do
      assert_select "input[name=?]", "address_book[name]"
      assert_select "textarea[name=?]", "address_book[note]"
    end
  end

end
