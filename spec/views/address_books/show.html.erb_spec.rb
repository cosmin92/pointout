require 'rails_helper'

RSpec.describe "address_books/show", type: :view do
  before(:each) do
    group = create(:group)
    forwarder = create(:forwarder, :group => group)
    add_book1 = create(:address_book, :name => "Name1", :forwarder => forwarder, :group => group)
    @address_book = assign(:address_book, add_book1)
  end

  it "renders attributes" do
    render
    expect(rendered).to match(/Name1/)
  end
end
