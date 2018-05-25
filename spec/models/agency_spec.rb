require 'rails_helper'

RSpec.describe Agency, type: :model do

  subject { described_class = build(:agency) }

  context "Factory" do

    it "have not nil name" do
      expect(subject.name).not_to be_nil
    end

    it "have not nil phone" do
      expect(subject.phone).not_to be_nil
    end

    it "have not nil email" do
      expect(subject.email).not_to be_nil
    end

    it "have not nil fax" do
      expect(subject.fax).not_to be_nil
    end

    it "have not nil street" do
      expect(subject.street).not_to be_nil
    end

    it "have not nil number" do
      expect(subject.number).not_to be_nil
    end

    it "have not nil city" do
      expect(subject.city).not_to be_nil
    end

    it "have not nil zip_code" do
      expect(subject.zip_code).not_to be_nil
    end

    it "have not nil note" do
      expect(subject.note).not_to be_nil
    end

    it "have not nil web site url" do
      expect(subject.web_site_url).not_to be_nil
    end

  end # end factory

  context "Attributes" do

    context "name" do

      it "should have a first name attribute" do
        expect(subject).to respond_to(:name)
      end

      it "should be invalid without a name" do
        subject.name = nil
        expect(subject).to be_invalid
      end

      it "should have length in 1..50" do
        subject.name = "a"*51
        expect(subject).to be_invalid
      end

    end # end name

    context "phone" do

      it "should have a phone attribute" do
        expect(subject).to respond_to(:phone)
      end

      it "should have length in 4..15" do
        subject.phone = "a" * 16
        expect(subject).to be_invalid 
      end

    end # end phone

    context "email" do

      it "should have an email attribute" do
        expect(subject).to respond_to(:email)
      end

      it "should be invalid without an email" do
        subject.email = nil
        expect(subject).to be_invalid   
      end

      it "should not be invalid with an invalid email" do
        subject.email = "ciaocaio"
        expect(subject).to be_invalid
      end

    end # end email

    context "street" do

      it "should have a street attribute" do
        expect(subject).to respond_to(:street)
      end

      it "should be invalid without street" do
        subject.street = nil
        expect(subject).to be_invalid
      end

      it "should have length in 5..50" do
        subject.street = "Error! This street name is too long! Error! This street name is too long!"
        expect(subject).to be_invalid
      end

    end # end street

    context "house number" do

      it "should have a house number attribute" do
        expect(subject).to respond_to(:number)
      end

      it "should be invalid without house number" do
        subject.number = nil
        expect(subject).to be_invalid
      end

      it "should have length in 1..5" do
        subject.number = "Error! This house number is too long!"
        expect(subject).to be_invalid
      end

    end # end house number

    context "city" do

      it "should have a city attribute" do
        expect(subject).to respond_to(:city)
      end

      it "should be invalid without city" do
        subject.city = nil
        expect(subject).to be_invalid
      end

      it "should have length in 2..30" do
        subject.city = "Error! This city name is too long!"
        expect(subject).to be_invalid
      end

    end # end city

    context "zip code" do

      it "should have a zip code attribute" do
        expect(subject).to respond_to(:zip_code)
      end

      it "should be invalid without zip code" do
        subject.zip_code = nil
        expect(subject).to be_invalid
      end

      it "should have length in 1..10" do
        subject.zip_code = "Error! This zip code is too long!"
        expect(subject).to be_invalid
      end
    end # end zip code



    context "note" do

      it "should have a note attribute" do
        expect(subject).to respond_to(:note)
      end
      
      it "should have length in max 500" do
        subject.note = "a"*501
        expect(subject).to be_invalid
      end

    end # end note

    context "web site url" do

      it "should have a web_site_url attribute" do
        expect(subject).to respond_to(:web_site_url)
      end

    end # end municipality

  end # end Attributes

  context "Methods" do
    it "should create a new agency record given valid attributes" do
      expect{
          subject.save 
      }.to change(Agency, :count).by(1)
    end

    it "should update a record" do
      create(:agency)
      agency = Agency.first
      expect(agency.name).to eq("Anas S.p.A. Direzione Centrale")
      agency.name = "Nuovo nome"
      agency.save
      agency = Agency.first
      expect(agency.name).to eq("Nuovo nome")
    end

    it "should destroy an exixting record" do
      Agency.destroy_all
      expect(Agency.all.count).to eq(0)
      create(:agency)
      expect(Agency.all.count).to eq(1)
      Agency.first.destroy
      expect(Agency.all.count).to eq(0)
    end

  end # end Methods

  context "Associations" do

    it "belong to forwarder" do
      association = Agency.reflect_on_association(:forwarder)
      expect(association.macro).to eq(:belongs_to)
    end

    it "has many reports" do
      association = Agency.reflect_on_association(:reports)
      expect(association.macro).to eq(:has_many)
    end

    it "has many contacts" do
      association = Agency.reflect_on_association(:contacts)
      expect(association.macro).to eq(:has_many)
    end

    it "has many address books" do
      association = Agency.reflect_on_association(:address_books)
      expect(association.macro).to eq(:has_many)
    end

  end # end Associations

end
