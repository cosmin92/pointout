require 'rails_helper'

RSpec.describe Contact, type: :model do

  subject {described_class = create(:contact)}

  context "Factory" do

    it "have not nil agency" do
      expect(subject.agency).not_to be_nil
    end

    it "have not nil address_book" do
      expect(subject.address_book).not_to be_nil
    end

  end # end factory

  context "Methods" do
    it "should create a new contact record given valid attributes" do
      expect {
        subject.save
      }.to change(Contact, :count).by(1)
    end

    it "should destroy an exixting contact" do
      Contact.destroy_all
      expect(Contact.all.count).to eq(0)
      create(:contact)
      expect(Contact.all.count).to eq(1)
      Contact.first.destroy
      expect(Contact.all.count).to eq(0)
    end

  end # end Methods

  context "Associations" do

    it "belongs to agency" do
      association = Contact.reflect_on_association(:agency)
      expect(association.macro).to eq(:belongs_to)
    end

    it "belongs to adress book" do
      association = Contact.reflect_on_association(:address_book)
      expect(association.macro).to eq(:belongs_to)
    end

  end # end Associations
end
