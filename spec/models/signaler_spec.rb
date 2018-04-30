require 'rails_helper'

RSpec.describe Signaler, type: :model do
  subject { described_class = build(:signaler) } 

  context "Factory" do 
    it "have not nil first_name" do
      expect(subject.first_name).not_to be_nil
    end
    it "have not nil last_name" do
      expect(subject.last_name).not_to be_nil
    end
    it "have not nil phone" do
      expect(subject.phone).not_to be_nil
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
    it "have not nil id_card_number" do
      expect(subject.id_card_number).not_to be_nil
    end
    it "have not nil municipality" do
      expect(subject.municipality).not_to be_nil
    end
    it "have not nil release_date" do
      expect(subject.release_date).not_to be_nil
    end
    it "have not nil expiration_date" do
      expect(subject.expiration_date).not_to be_nil
    end
  end

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
    
    context "phone" do
      it "should have a phone attribute" do
        expect(subject).to respond_to(:phone)
      end

      it "should be invalid without a phone" do
        subject.phone = nil
        expect(subject).to be_invalid   
      end

      it "should have length in 4..15" do
        subject.phone = "Error! This phone number is too long!"
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


    # === RESIDENCE ==== # 
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


    # === RESIDENCE ==== # 
    context 'id card number' do
      it 'should have an id card number' do
        expect(subject).to respond_to(:id_card_number)
      end

      it "should be invalid without an id card number" do
        subject.id_card_number = nil
        expect(subject).to be_invalid   
      end

      it "should have length in 8..20" do
        subject.id_card_number = "Error! This id card number is too long!"
        expect(subject).to be_invalid 
      end
    end # end id card number

    context "municipality" do
      it "should have a municipality attribute" do
        expect(subject).to respond_to(:municipality)
      end

      it "should be invalid without municipality" do
        subject.municipality = nil
        expect(subject).to be_invalid   
      end

      it "should have length in 2..30" do
        subject.municipality = "Error! This municipality name is too long!"
        expect(subject).to be_invalid 
      end
    end # end municipality

    context "release date" do
      it "should have a release date" do
        expect(subject).to respond_to(:release_date)
      end
    end # end release date

    context "expration date" do
      it "should have an expiration date" do
        expect(subject).to respond_to(:expiration_date)
      end
    end # end expiration date
  end # end Attributes

  context "Methods" do
    it "should create a new signaler record given valid attributes" do
      expect{
          subject.save 
      }.to change(Signaler, :count).by(1)
    end

    it "should update a record" do
      create(:signaler, :first_name => "Pluto")
      signaler =  Signaler.first
      expect(signaler.first_name).to eq("Pluto")
      signaler.first_name = "Pippo"
      signaler.save
      signaler = Signaler.first
      expect(signaler.first_name).to eq("Pippo")
    end

    it "should destroy an exixting record" do
      Signaler.destroy_all
      expect(Signaler.all.count).to eq(0)
      create(:signaler)
      expect(Signaler.all.count).to eq(1)
      Signaler.first.destroy
      expect(Signaler.all.count).to eq(0)
    end

    it "should return full name" do
      subject.first_name = "Pinco"
      subject.last_name = "Pallino"
      expect(subject.full_name).to eq("Pinco Pallino")
    end


  end # end Methods

  xcontext "Associations" do
    it "has many reports" do
      association = Signaler.reflect_on_association(:reports)
      expect(association.macro).to eq(:has_many)
    end
      
    it "has many observations" do
      association = Signaler.reflect_on_association(:observations)
      expect(association.macro).to eq(:has_many)
    end
      
    it "has many interventions" do
      association = Signaler.reflect_on_association(:interventions)
      expect(association.macro).to eq(:has_many)
    end

    it "has many opinions" do
      association = Signaler.reflect_on_association(:opinions)
      expect(association.macro).to eq(:has_many)
    end
  end # end Associations
end
