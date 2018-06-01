require 'rails_helper'

RSpec.describe "address_books/edit", type: :view do
  before(:each) do
    group = create(:group)
    forwarder = create(:forwarder, :group => group)
    add_book1 = create(:address_book, :name => "Name1", :forwarder => forwarder, :group => group)

    @address_book = assign(:address_book, add_book1)
  end

  it "renders the edit address_book form" do
    render

    assert_select "form[action=?][method=?]", address_book_path(@address_book), "post" do

      assert_select "input[name=?]", "address_book[name]"

      assert_select "textarea[name=?]", "address_book[note]"
    end
  end
end
