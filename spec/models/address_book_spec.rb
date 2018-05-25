require 'rails_helper'

RSpec.describe AddressBook, type: :model do
  subject { described_class = build(:address_book) }
 
  context "Factory" do

    it "have not nil name" do
      expect(subject.name).not_to be_nil
    end

    it "have not nil note" do
      expect(subject.note).not_to be_nil
    end

  end #end factory

  context "Attributes" do

    context "name" do
      it "should have an name attribute" do
        expect(subject).to respond_to(:name)
      end
 
      it "should be invalid without an name" do
        subject.name = nil
        expect(subject).to be_invalid
      end
 
      it "should have length in 4..50" do
        subject.name = "a"*51
        expect(subject).to be_invalid
      end

    end # end name
 
    context "note" do

      it "should have a note attribute" do
        expect(subject).to respond_to(:note)
      end
      
      it "should have length in max 500" do
        subject.note = "a"*501
        expect(subject).to be_invalid
      end

    end # end note

  end # end Attributes

  context "Methods" do
    it "should create a new addressBook record given valid attributes" do
      expect{
          subject.save
      }.to change(AddressBook, :count).by(1)
    end
 
    it "should update a record" do
      create(:address_book)
      address_book = AddressBook.first
      expect(address_book.name).to eq("Enti per problemi di Illuminazione Pubblica")
      address_book.name = "Nuovo nome"
      address_book.save
      address_book = AddressBook.first
      expect(address_book.name).to eq("Nuovo nome")
    end
 
    it "should destroy an exixting record" do
      AddressBook.destroy_all
      expect(AddressBook.all.count).to eq(0)
      create(:address_book)
      expect(AddressBook.all.count).to eq(1)
      AddressBook.first.destroy
      expect(AddressBook.all.count).to eq(0)
    end
  end # end Methods
 
  context "Associations" do
    it "belongs to forwarder" do
      association = AddressBook.reflect_on_association(:forwarder)
      expect(association.macro).to eq(:belongs_to)
    end

    it "belongs to group" do
      association = AddressBook.reflect_on_association(:group)
      expect(association.macro).to eq(:belongs_to)
    end
 
    it "has many contacts" do
      association = AddressBook.reflect_on_association(:contacts)
      expect(association.macro).to eq(:has_many)
    end
 
    it "has many agencies" do
      association = AddressBook.reflect_on_association(:agencies)
      expect(association.macro).to eq(:has_many)
    end
  end # end Associations
end
