require 'rails_helper'

RSpec.describe Report, type: :model do

  subject {described_class = build(:report)}

  context "Factory" do

    it "have not nil object" do
      expect(subject.object).not_to be_nil
    end

    it "have not nil description" do
      expect(subject.description).not_to be_nil
    end

    it "have not nil address" do
      expect(subject.address).not_to be_nil
    end

    it "have not nil longitude" do
      expect(subject.longitude).not_to be_nil
    end

    it "have not nil latitude" do
      expect(subject.latitude).not_to be_nil
    end

    it "have not nil report type" do
      expect(subject.report_type).not_to be_nil
    end

    it "have not nil intervention type" do
      expect(subject.intervention_type).not_to be_nil
    end

    it "have not nil signaler" do
      expect(subject.signaler).not_to be_nil
    end

    it "have not nil tipology" do
      expect(subject.tipology).not_to be_nil
    end

  end # end factory

  context "Attributes" do

    context "object" do

      it "should have an object attribute" do
        expect(subject).to respond_to(:object)
      end

      it "should be invalid without an object" do
        subject.object = nil
        expect(subject).to be_invalid
      end

      it "should have length in 4..50" do
        subject.object = "Error! This first name is too long!Error! This first name is too long!Error! This first name is too long!Error! This first name is too long!Error! This first name is too long!Error! This first name is too long!Error! This first name is too long!Error! This first name is too long!Error! This first name is too long!Error! This first name is too long!"
        expect(subject).to be_invalid
      end

    end # end address

    context "description" do

      it "should have a description attribute" do
        expect(subject).to respond_to(:description)
      end

      it "should be invalid without a description" do
        subject.description = nil
        expect(subject).to be_invalid
      end

      it "should have length max 1000" do
        subject.description = "a" * 1001
        expect(subject).to be_invalid
      end

    end # end description

    context "address" do

      it "should have an address attribute" do
        expect(subject).to respond_to(:address)
      end

      it "should be invalid without an address" do
        subject.address = nil
        expect(subject).to be_invalid
      end

      it "should have length in 2..100" do
        subject.address = "a" * 101
        expect(subject).to be_invalid
      end

    end # end address

    context "longitude" do

      it "should have a longitude attribute" do
        expect(subject).to respond_to(:longitude)
      end

      it "should be invalid without a longitude" do
        subject.longitude = nil
        expect(subject).to be_invalid
      end

    end # end longitude

    context "latitude" do

      it "should have a latitude attribute" do
        expect(subject).to respond_to(:latitude)
      end

      it "should be invalid without a latitude" do
        subject.latitude = nil
        expect(subject).to be_invalid
      end

    end # end latitude

    context "report type" do

      it "should have a report type attribute" do
        expect(subject).to respond_to(:report_type)
      end

      it "should include 'suggestion' type" do
        subject.report_type = "Suggestion"
        expect(subject).to be_valid
      end

      it "should include 'segnalation' type" do
        subject.report_type = "Segnalation"
        expect(subject).to be_valid
      end

      it "should include 'complaint' type" do
        subject.report_type = "Complaint"
        expect(subject).to be_valid
      end

      it "should not include other report types" do
        subject.report_type = "other_type"
        expect(subject).to be_invalid
      end

    end # end report type

    context "intervention type" do

      it "should have a intervention type attribute" do
        expect(subject).to respond_to(:intervention_type)
      end

      it "should include 'preventive' intervention type" do
        subject.intervention_type = "Preventive"
        expect(subject).to be_valid
      end

      it "should include 'corrective' intervention type" do
        subject.intervention_type = "Corrective"
        expect(subject).to be_valid
      end

    end # end intervention type

  end # end Attributes

  context "Methods" do

    it "should create a new report record given valid attributes" do
      expect {
        subject.save
      }.to change(Report, :count).by(1)
    end

    it "should update a record" do
      create(:report)
      report = Report.first
      expect(report.object).to eq("Cos’è Lorem Ipsum?")
      report.object = "Buche sulla strada"
      report.save
      report = Report.first
      expect(report.object).to eq("Buche sulla strada")
    end

    it "should destroy an exixting record" do
      Report.destroy_all
      expect(Report.all.count).to eq(0)
      create(:report)
      expect(Report.all.count).to eq(1)
      Report.first.destroy
      expect(Report.all.count).to eq(0)
    end

  end # end Methods

  context "Scopes" do

    let(:setup_database) do
      tipology = create(:tipology)
      signaler = create(:signaler, :email => "pinco.pallinio@gmail.com", :phone => "123456", :id_card_number => "12345678")
      signaler1 = create(:signaler, :email => "barba.rossa@gmail.com", :phone => "654321", :id_card_number => "87654321")
      signaler2 = create(:signaler, :email => "tizio.caio@gmail.com", :phone => "6543210", :id_card_number => "876543210")

      create(:report, :object => "z primo report inserito", :tipology => tipology)
      create(:report, :object => "a secondo report inserito", :signaler => signaler, :tipology => tipology, :longitude => 41.932557, :latitude => 12.441541)
      create(:report, :object => "s terzo report inserito", :signaler => signaler1, :tipology => tipology, :longitude => 41.933057, :latitude => 12.440896)
      create(:report, :object => "t terzo report inserito", :signaler => signaler2, :tipology => tipology, :longitude => 41.931951, :latitude => 12.442558) #Via Trionfale, 6649-6551, 00135 Roma RM maggiore di 50m
    end

    it "should get reports ordered by date asc" do
      setup_database
      expect(Report.ordered_by_creation_date_asc.first.object).to eq("z primo report inserito")
      expect(Report.ordered_by_creation_date_asc.last.object).to eq("t terzo report inserito")
    end

    it "should get reports ordered by date desc" do
      setup_database
      expect(Report.ordered_by_creation_date_desc.first.object).to eq("t terzo report inserito")
      expect(Report.ordered_by_creation_date_desc.last.object).to eq("z primo report inserito")
    end

    it "should get reports ordered by object asc" do
      setup_database
      expect(Report.ordered_by_object_asc.first.object).to eq("a secondo report inserito")
      expect(Report.ordered_by_object_asc.last.object).to eq("z primo report inserito")
    end

    it "should get reports ordered by object desc" do
      setup_database
      expect(Report.ordered_by_object_desc.first.object).to eq("z primo report inserito")
      expect(Report.ordered_by_object_desc.last.object).to eq("a secondo report inserito")
    end

    it "should get only nearby reports" do
      setup_database
      center = {:longitude => 41.93224524160291, :latitude => 12.440350581054645}
      expect(Report.nearby(center, 200).count).to eq(3)
    end

  end # end scopes

  context "Associations" do

    it "belongs to signaler" do
      association = Report.reflect_on_association(:signaler)
      expect(association.macro).to eq(:belongs_to)
    end

    it "belongs to tipology" do
      association = Report.reflect_on_association(:tipology)
      expect(association.macro).to eq(:belongs_to)
    end

    it "belongs to agency" do
      association = Report.reflect_on_association(:agency)
      expect(association.macro).to eq(:belongs_to)
    end

    it "belongs to forwarder" do
      association = Report.reflect_on_association(:forwarder)
      expect(association.macro).to eq(:belongs_to)
    end

    it "has many interventions" do
      association = Report.reflect_on_association(:interventions)
      expect(association.macro).to eq(:has_many)
    end

    it "has many observations" do
      association = Report.reflect_on_association(:observations)
      expect(association.macro).to eq(:has_many)
    end

  end # end Associations

end