require 'rails_helper'

RSpec.describe "address_books/index", type: :view do
  before(:each) do
    group = create(:group)
    forwarder = create(:forwarder, :group => group)
    add_book1 = create(:address_book, :name => "Name1", :forwarder => forwarder, :group => group)
    add_book2 = create(:address_book, :name => "Name2", :forwarder => forwarder, :group => group)
    assign(:address_books, [add_book1, add_book2])
  end

  it "renders a list of address_books" do
    render
    
    expect(rendered).to have_content("Name1")
    expect(rendered).to have_content("Name2")
  end
end
