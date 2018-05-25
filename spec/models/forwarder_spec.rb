require 'rails_helper'

RSpec.describe Forwarder, type: :model do

  subject { described_class = build(:forwarder) }

  context "Factory" do

    it "have not nil first_name" do
      expect(subject.first_name).not_to be_nil
    end

    it "have not nil last_name" do
      expect(subject.last_name).not_to be_nil
    end

    it "have not nil email" do
      expect(subject.email).not_to be_nil
    end

    it "have not nil password" do
      expect(subject.password).not_to be_nil
    end

    it "have not nil profile_picture" do
      expect(subject.profile_picture).not_to be_nil
    end

  end# end factory

  context "Attributes" do

    context "first name" do

      it "should have a first name attribute" do
        expect(subject).to respond_to(:first_name)
      end

      it "should be invalid without a first name" do
        subject.first_name = nil
        expect(subject).to be_invalid   
      end

      it "should have length in 1..30" do
        subject.first_name = "Error! This first name is too long!"
        expect(subject).to be_invalid 
      end

    end # end first name

    context "last name" do

      it "should have a last name attribute" do
        expect(subject).to respond_to(:last_name)
      end

      it "should be invalid without a last name" do
        subject.last_name = nil
        expect(subject).to be_invalid   
      end

      it "should have length in 1..30" do
        subject.last_name = "Error! This last name is too long!"
        expect(subject).to be_invalid 
      end

    end # end last name

    context "email" do

      it "should have an email attribute" do
        expect(subject).to respond_to(:email)
      end

      it "should be invalid without an email" do
        subject.email = nil
        expect(subject).to be_invalid
      end

    end # end email

    context "password field" do

      it "should have a password attribute" do
        expect(subject).to respond_to(:password)
      end

      it "should have a password confirmation attribute" do
        expect(subject).to respond_to(:password_confirmation)
      end

      it "should non be valid without a password" do
        subject.password = ""
        subject.password_confirmation = ""
        expect(subject).to be_invalid
      end

      it "should require a matching password confirmation" do
        subject.password_confirmation = ""
        expect(subject).to be_invalid
      end

      it "should no be valid with short passwords" do
        subject.password = "a" * 5
        expect(subject).to be_invalid
      end

      it "should have an encrypted password attribute" do
        expect(subject).to respond_to(:encrypted_password)
      end

      it "should set the encrypted password attribute" do
        expect(subject.encrypted_password).not_to be_blank
      end

    end # end password

    context "profile picture" do

      it "should have a profile picture attribute" do
        expect(subject).to respond_to(:profile_picture)
      end

    end # end profile picture

  end # end Attributes

  context "Methods" do

    it "should create a new forwarder record given valid attributes" do
      expect{
          subject.save
      }.to change(Forwarder, :count).by(1)
    end

    it "should update a record" do
      create(:forwarder, :first_name => "Pluto")
      forwarder =  Forwarder.first
      expect(forwarder.first_name).to eq("Pluto")
      forwarder.first_name = "Pippo"
      forwarder.save
      forwarder = Forwarder.first
      expect(forwarder.first_name).to eq("Pippo")
    end

    it "should destroy an exixting record" do
      Forwarder.destroy_all
      expect(Forwarder.all.count).to eq(0)
      create(:forwarder)
      expect(Forwarder.all.count).to eq(1)
      Forwarder.first.destroy
      expect(Forwarder.all.count).to eq(0)
    end

    it "should return full name" do
      subject.first_name = "Pinco"
      subject.last_name = "Pallino"
      expect(subject.full_name).to eq("Pinco Pallino")
    end

  end # end Methods

  context "Associations" do

    it "has many reports" do
      association = Forwarder.reflect_on_association(:reports)
      expect(association.macro).to eq(:has_many)
    end

    it "has many address_books" do
      association = Forwarder.reflect_on_association(:address_books)
      expect(association.macro).to eq(:has_many)
    end

    it "has many agencies" do
      association = Forwarder.reflect_on_association(:agencies)
      expect(association.macro).to eq(:has_many)
    end

    it "belongs to group" do
      association = Forwarder.reflect_on_association(:group)
      expect(association.macro).to eq(:belongs_to)
    end

    it "has many tipologies" do
      association = Forwarder.reflect_on_association(:tipologies)
      expect(association.macro).to eq(:has_many)
    end

    it "has many notices" do
      association = Forwarder.reflect_on_association(:notices)
      expect(association.macro).to eq(:has_many)
    end
  end # end Associations

end
