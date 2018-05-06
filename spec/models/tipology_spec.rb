require 'rails_helper'

RSpec.describe Tipology, type: :model do
  subject { described_class = build(:tipology) } 

  context "Factory" do 
    it "have not nil _name" do
      expect(subject.name).not_to be_nil
    end

    it "have not nil description" do
      expect(subject.description).not_to be_nil
    end

    it "have not nil logo" do
      expect(subject.logo).not_to be_nil
    end

  end

  context "Attributes" do
    context "name" do
      it "should have a name attribute" do
        expect(subject).to respond_to(:name)
      end

      it "should be invalid without a name" do
        subject.name = nil
        expect(subject).to be_invalid
      end

      it "should have length in 3..50" do
        subject.name = "Error! This first name is too long! Error! This first name is too long! Error! This first name is too long!"
        expect(subject).to be_invalid
      end
    end # end name

    context "description" do
      it "should have a description attribute" do
        expect(subject).to respond_to(:description)
      end

      it "should be invalid without a description" do
        subject.description = nil
        expect(subject).to be_invalid
      end
    end # end description

  end # end Attributes

  context "Methods" do
    it "should create a new tipology record given valid attributes" do
      expect{
          subject.save 
      }.to change(Tipology, :count).by(1)
    end

    it "should update a record" do
      create(:tipology, :name => "Illuminazione stradale")
      tipology =  Tipology.first
      expect(tipology.name).to eq("Illuminazione stradale")
      tipology.name = "Dissesto stradale"
      tipology.save
      tipology = Tipology.first
      expect(tipology.name).to eq("Dissesto stradale")
    end

    it "should destroy an exixting record" do
      Tipology.destroy_all
      expect(Tipology.all.count).to eq(0)
      create(:tipology)
      expect(Tipology.all.count).to eq(1)
      Tipology.first.destroy
      expect(Tipology.all.count).to eq(0)
    end
  end # end Methods

  context "Associations" do

    it "has many tipologies" do
      association = Tipology.reflect_on_association(:children)
      expect(association.macro).to eq(:has_many)
    end

    it "belongs to tipology" do
      association = Tipology.reflect_on_association(:parent)
      expect(association.macro).to eq(:belongs_to)
    end

    xit "has many reports" do
      association = Tipology.reflect_on_association(:reports)
      expect(association.macro).to eq(:has_many)
    end
      
    xit "has many occupations" do
      association = Tipology.reflect_on_association(:occupations)
      expect(association.macro).to eq(:has_many)
    end
      
    xit "has many groups" do
      association = Tipology.reflect_on_association(:groups)
      expect(association.macro).to eq(:has_many)
    end

    xit "belogns to forwarder" do
      association = Tipology.reflect_on_association(:forwarder)
      expect(association.macro).to eq(:belongs_to)
    end
    
  end # end Associations
end
