require 'rails_helper'

RSpec.describe Observation, type: :model do

  subject {described_class = create(:observation)}

  context "Factory" do

    it "have not nil content" do
      expect(subject.content).not_to be_nil
    end
    it "have not nil signaler" do
      subject = build(:observation)
      expect(subject.signaler).not_to be_nil
    end
    it "have not nil report" do
      subject = build(:observation)
      expect(subject.report).not_to be_nil
    end

  end #end factory

  context "content" do

    it "should have a content attribute" do
      expect(subject).to respond_to(:content)
    end

    it "should be invalid without a content" do
      subject.content = nil
      expect(subject).to be_invalid
    end

    it "should have length in 2..5000" do
      subject.content = "a" * 5001
      expect(subject).to be_invalid
    end

  end # end address

  context "Methods" do

    it "should create a new observation record given valid attributes" do
      expect {
        subject.save
      }.to change(Observation, :count).by(1)
    end

    it "should update a record" do
      create(:observation)
      observation = Observation.first
      expect(observation.content).to eq("Lorem Ipsum è un testo segnaposto utilizzato nel settore della tipografia e della stampa. Lorem Ipsum è considerato il testo segnaposto standard sin dal sedicesimo secolo, quando un anonimo tipografo prese una cassetta di caratteri e li assemblò per preparare un testo campione. È sopravvissuto non solo a più di cinque secoli, ma anche al passaggio alla videoimpaginazione, pervenendoci sostanzialmente inalterato. Fu reso popolare, negli anni ’60, con la diffusione dei fogli di caratteri trasferibili “Letraset”, che contenevano passaggi del Lorem Ipsum, e più recentemente da software di impaginazione come Aldus PageMaker, che includeva versioni del Lorem Ipsum.")
      observation.content = "observation"
      observation.save
      observation = Observation.first
      expect(observation.content).to eq("observation")
    end

    it "should destroy an exixting record" do
      Observation.destroy_all
      expect(Observation.all.count).to eq(0)
      create(:observation)
      expect(Observation.all.count).to eq(1)
      Observation.first.destroy
      expect(Observation.all.count).to eq(0)
    end

  end # end Methods

  context "Associations" do

    it "belong to report" do
      association = Observation.reflect_on_association(:report)
      expect(association.macro).to eq(:belongs_to)
    end

    it "belong to signaler" do
      association = Observation.reflect_on_association(:signaler)
      expect(association.macro).to eq(:belongs_to)
    end

  end # end Associations

end
