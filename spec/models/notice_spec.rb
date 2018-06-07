require 'rails_helper'

RSpec.describe Notice, type: :model do
  subject {described_class = build(:notice)}

  context "Factory" do

    it "have not nil title" do
      expect(subject.title).not_to be_nil
    end

    it "have not nil content" do
      expect(subject.content).not_to be_nil
    end

    it "have not nil posting date" do
      expect(subject.posting_date).not_to be_nil
    end

    it "have not nil expiration date" do
      expect(subject.expiration_date).not_to be_nil
    end

    it "have not nil notice type" do
      expect(subject.notice_type).not_to be_nil
    end

  end # end factory

  context "Attributes" do

    context "title" do
      it "should have an title attribute" do
        expect(subject).to respond_to(:title)
      end

      it "should be invalid without an title" do
        subject.title = nil
        expect(subject).to be_invalid
      end

      it "should have length in 4..50" do
        subject.title = "a" * 51
        expect(subject).to be_invalid
      end

    end # end title

    context "content" do

      it "should have a content attribute" do
        expect(subject).to respond_to(:content)
      end

      it "should be invalid without content" do
        subject.content = nil
        expect(subject).to be_invalid
      end

      it "should have length max 1000" do
        subject.content = "a" * 1001
        expect(subject).to be_invalid
      end

    end # end description

    context "posting date" do

      it "should have a posting date" do
        expect(subject).to respond_to(:posting_date)
      end

    end # end posting date

    context "expration date" do

      it "should have an expiration date" do
        expect(subject).to respond_to(:expiration_date)
      end

    end # end expiration date

    context "notice type" do

      it "should have a notice type attribute" do
        expect(subject).to respond_to(:notice_type)
      end

      it "should include 'information' type" do
        subject.notice_type = "Information"
        expect(subject).to be_valid
      end

      it "should include 'warning' type" do
        subject.notice_type = "Warning"
        expect(subject).to be_valid
      end

      it "should include 'obbligation' type" do
        subject.notice_type = "Obbligation"
        expect(subject).to be_valid
      end

      it "should include 'result' type" do
        subject.notice_type = "Result"
        expect(subject).to be_valid
      end

      it "should not include other notice types" do
        subject.notice_type = "other_type"
        expect(subject).to be_invalid
      end

    end # end notice type

  end # end Attributes

  context "Methods" do
    it "should create a new notice record given valid attributes" do
      expect {
        subject.save
      }.to change(Notice, :count).by(1)
    end

    it "should update a record" do
      create(:notice)
      notice = Notice.first
      expect(notice.title).to eq("Nuova Rubrica nella lista")
      notice.title = "Nuovo nome"
      notice.save
      notice = Notice.first
      expect(notice.title).to eq("Nuovo nome")
    end

    it "should destroy an exixting record" do
      Notice.destroy_all
      expect(Notice.all.count).to eq(0)
      create(:notice)
      expect(Notice.all.count).to eq(1)
      Notice.first.destroy
      expect(Notice.all.count).to eq(0)
    end

  end # end Methods

  context "Associations" do

    it "belongs to forwarder" do
      association = Notice.reflect_on_association(:forwarder)
      expect(association.macro).to eq(:belongs_to)
    end

    it "belongs to group" do
      association = Notice.reflect_on_association(:group)
      expect(association.macro).to eq(:belongs_to)
    end

  end # end Associations

end
