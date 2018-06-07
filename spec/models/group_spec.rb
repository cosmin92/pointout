require 'rails_helper'

RSpec.describe Group, type: :model do

  subject {described_class = build(:group)}

  context "Factory" do

    it "have not nil name" do
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

    it "should create a new group record given valid attributes" do
      expect {
        subject.save
      }.to change(Group, :count).by(1)
    end

    it "should update a record" do
      create(:group, :name => "Illuminazione stradale")
      group = Group.first
      expect(group.name).to eq("Illuminazione stradale")
      group.name = "Dissesto stradale"
      group.save
      group = Group.first
      expect(group.name).to eq("Dissesto stradale")
    end

    it "should destroy an exixting record" do
      Group.destroy_all
      expect(Group.all.count).to eq(0)
      create(:group)
      expect(Group.all.count).to eq(1)
      Group.first.destroy
      expect(Group.all.count).to eq(0)
    end

  end # end Methods

  context "Associations" do

    it "has many subgroups" do
      association = Group.reflect_on_association(:children)
      expect(association.macro).to eq(:has_many)
    end

    it "belongs to Group" do
      association = Group.reflect_on_association(:parent)
      expect(association.macro).to eq(:belongs_to)
    end

    it "has many forwarders" do
      association = Group.reflect_on_association(:forwarders)
      expect(association.macro).to eq(:has_many)
    end

    it "has many occupations" do
      association = Group.reflect_on_association(:occupations)
      expect(association.macro).to eq(:has_many)
    end

    it "has many tipologies" do
      association = Group.reflect_on_association(:tipologies)
      expect(association.macro).to eq(:has_many)
    end

    it "has many address_books" do
      association = Group.reflect_on_association(:address_books)
      expect(association.macro).to eq(:has_many)
    end

    it "has many notices" do
      association = Group.reflect_on_association(:notices)
      expect(association.macro).to eq(:has_many)
    end
  end # end Associations
end
