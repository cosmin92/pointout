require 'rails_helper'

RSpec.describe Occupation, type: :model do

  subject {described_class = create(:occupation)}

  context "Factory" do

    it "have not nil tipology" do
      expect(subject.tipology).not_to be_nil
    end

    it "have not nil group" do
      expect(subject.group).not_to be_nil
    end

  end # end factory

  context "Methods" do

    it "should create a new occupation record given valid attributes" do
      expect {
        subject.save
      }.to change(Occupation, :count).by(1)
    end

    it "should destroy an exixting occupation" do
      Occupation.destroy_all
      expect(Occupation.all.count).to eq(0)
      create(:occupation)
      expect(Occupation.all.count).to eq(1)
      Occupation.first.destroy
      expect(Occupation.all.count).to eq(0)
    end

  end # end Methods

  context "Associations" do

    it "belongs to group" do
      association = Occupation.reflect_on_association(:group)
      expect(association.macro).to eq(:belongs_to)
    end

    it "belongs to tipology" do
      association = Occupation.reflect_on_association(:tipology)
      expect(association.macro).to eq(:belongs_to)
    end

  end # end Associations

end
