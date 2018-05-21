require 'rails_helper'

RSpec.describe Intervention, type: :model do

  subject {described_class = create(:intervention) }

  context "Factory" do
    it "have not nil intervention type" do
      expect(subject.intervention_type).not_to be_nil
    end

    it "have not nil report" do
      expect(subject.report).not_to be_nil
    end
  
    it "have not nil signaler" do
      expect(subject.signaler).not_to be_nil
    end

  end
  
  context "Attributes" do
    context "intervention type" do
      it "should have a intervention type attribute" do
        expect(subject).to respond_to(:intervention_type)
      end

      it "should include 'immediate' intervention type" do
        subject.intervention_type = "Immediate"
        expect(subject).to be_valid
      end

      it "should include 'ordinary' intervention type" do
        subject.intervention_type = "Ordinary"
        expect(subject).to be_valid
      end
    end # end intervention type
  end # end Attributes

  context "Methods" do
    it "should create a new interventio record given valid attributes" do
      expect{
          subject.save 
      }.to change(Intervention, :count).by(1)
    end

    it "should update a record" do
      create(:intervention)
      intervention = Intervention.first
      expect(intervention.intervention_type).to eq("Ordinary")
      intervention.intervention_type = "Immediate"
      intervention.save
      intervention = Intervention.first
      expect(intervention.intervention_type).to eq("Immediate")
    end

    it "should destroy an exixting intervention" do
      Intervention.destroy_all
      expect(Intervention.all.count).to eq(0)
      create(:intervention)
      expect(Intervention.all.count).to eq(1)
      Intervention.first.destroy
      expect(Intervention.all.count).to eq(0)
    end

  end # end Methods

  context "Associations" do
    it "belongs to report" do
      association = Intervention.reflect_on_association(:report)
      expect(association.macro).to eq(:belongs_to)
    end

    it "belongs to signaler" do
      association = Intervention.reflect_on_association(:signaler)
      expect(association.macro).to eq(:belongs_to)
    end
  end
end
