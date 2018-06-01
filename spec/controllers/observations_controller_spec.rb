require 'rails_helper'

RSpec.describe ObservationsController, type: :controller do

  def attributes(signaler, tipology)
    @attributes = { :object => "Cos’è Lorem Ipsum?", :description => "a"*400, :address => "Via Trionfale, 6751, 00100 Roma RM, Italia", :longitude => 41.93224524160291, :latitude => 12.440350581054645, :report_type => "Suggestion", :intervention_type => "Corrective", :signaler_id => signaler.id, :tipology_id => tipology.id}
  end

  describe "create action" do

    it "routes to #create" do
      expect(:post => "/reports/1/observations").to route_to("observations#create", :report_id => "1")
    end

    it "creates a new Report" do
        signaler = create(:signaler)
        tipology = create(:tipology)
        attributes(signaler, tipology)
        report = Report.create(@attributes)
        sign_in signaler
        expect {
          post :create, params: {observation: {:content => "observation"}, :report_id => report.id.to_param}
        }.to change(Observation, :count).by(1)
      end

      it "redirects to the created report" do
        signaler = create(:signaler)
        tipology = create(:tipology)
        attributes(signaler, tipology)
        report = Report.create(@attributes)
        sign_in signaler
        post :create, params: {observation: {:content => "observation"}, :report_id => report.id.to_param}
        expect(response).to redirect_to(report)
      end

      it "creates new observation for report" do
        signaler = create(:signaler)
        tipology = create(:tipology)
        attributes(signaler, tipology)
        report = Report.create(@attributes)
        sign_in signaler
         expect {
          post :create, params: {observation: {:content => "observation"}, :report_id => report.id.to_param}
        }.to change(report.observations, :count).by(1)
      end

      it " authon have plus one observation" do
        signaler = create(:signaler)
        tipology = create(:tipology)
        attributes(signaler, tipology)
        report = Report.create(@attributes)
        sign_in signaler
         expect {
          post :create, params: {observation: {:content => "observation"}, :report_id => report.id.to_param}
        }.to change(signaler.observations, :count).by(1)
      end

  end

  describe "destroy action" do

    it "routes to #destroy" do
      expect(:delete => "/reports/1/observations/1").to route_to("observations#destroy", :report_id => "1", :id => "1")
    end

    it "destroys the requested report" do
      signaler = create(:signaler)
      tipology = create(:tipology)
      attributes(signaler, tipology)
      sign_in signaler
      report = Report.create! @attributes

      observation = Observation.create(:signaler => signaler, :report => report, :content => "a"*50)
      expect {
        delete :destroy, params: {report_id: report.to_param, :id => observation.id}
      }.to change(report.observations, :count).by(-1)
    end

    it "redirects to the reports list" do
      signaler = create(:signaler)
      tipology = create(:tipology)
      attributes(signaler, tipology)
      sign_in signaler
      report = Report.create! @attributes

      observation = Observation.create(:signaler => signaler, :report => report, :content => "a"*50)
      delete :destroy, params: {report_id: report.to_param, :id => observation.id}
      expect(response).to redirect_to(report_path)
    end

  end

end
