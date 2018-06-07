require 'rails_helper'

RSpec.describe ReportsController, type: :controller do

  include Devise::Test::ControllerHelpers

  def attributes(signaler, tipology)
    @attributes = {:object => "Cos’è Lorem Ipsum?", :description => "a" * 400, :address => "Via Trionfale, 6751, 00100 Roma RM, Italia", :longitude => 41.93224524160291, :latitude => 12.440350581054645, :report_type => "Suggestion", :intervention_type => "Corrective", :signaler_id => signaler.id, :tipology_id => tipology.id}
  end

  describe "index action" do

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "render index template" do
      get :index
      expect(response).to render_template(:index)
    end

    it "should rout to reports" do
      expect(:get => "/reports").to route_to("reports#index")
    end

    context "get reports by tipology" do

      it "should return a reports given tipology id" do
        tipology = create(:tipology)
        report = create(:report, :tipology => tipology)
        get :index, params: {:search => {:tipology_id => tipology.id}}
        expect(assigns(:reports)).to eq([report])
      end

      it "should not return reports if tipology has not reports" do
        tipology = create(:tipology, :forwarder => create(:forwarder, :email => "example@gmail.com"))
        report = create(:report)
        get :index, params: {:search => {:tipology_id => tipology.id}}
        expect(assigns(:reports)).to eq([])
      end

    end # end get reports by tipology

    context "get reports by type" do

      it "should return 'complaint' reports" do
        tipology = create(:tipology)
        signaler = create(:signaler)
        report1 = create(:report, :signaler => signaler, :tipology => tipology, :report_type => "Complaint")
        report2 = create(:report, :signaler => signaler, :tipology => tipology, :report_type => "Suggestion")
        get :index, params: {:search => {:report_type => "Complaint"}}
        expect(assigns(:reports)).to eq([report1])
      end

      it "should return 'segnalation' reports" do
        tipology = create(:tipology)
        signaler = create(:signaler)
        report1 = create(:report, :signaler => signaler, :tipology => tipology, :report_type => "Complaint")
        report2 = create(:report, :signaler => signaler, :tipology => tipology, :report_type => "Segnalation")
        get :index, params: {:search => {:report_type => "Segnalation"}}
        expect(assigns(:reports)).to eq([report2])
      end

      it "should return 'suggestion' reports" do
        tipology = create(:tipology)
        signaler = create(:signaler)
        report1 = create(:report, :signaler => signaler, :tipology => tipology, :report_type => "Complaint")
        report2 = create(:report, :signaler => signaler, :tipology => tipology, :report_type => "Suggestion")
        get :index, params: {:search => {:report_type => "Suggestion"}}
        expect(assigns(:reports)).to eq([report2])
      end

    end

    context "get reports ordered by creation date" do

      it "should return 'ASC' reports" do
        tipology = create(:tipology)
        signaler = create(:signaler)
        report1 = create(:report, :signaler => signaler, :tipology => tipology, :report_type => "Complaint")
        report2 = create(:report, :signaler => signaler, :tipology => tipology, :report_type => "Suggestion")
        get :index, params: {:search => {:creation_date => "asc"}}
        expect(assigns(:reports).first).to eq(report1)
      end

      it "should return 'DESC' reports" do
        tipology = create(:tipology)
        signaler = create(:signaler)
        report1 = create(:report, :signaler => signaler, :tipology => tipology, :report_type => "Complaint")
        report2 = create(:report, :signaler => signaler, :tipology => tipology, :report_type => "Segnalation")
        get :index, params: {:search => {:creation_date => "desc"}}
        expect(assigns(:reports).first).to eq(report2)
      end

    end # get reports ordered by creation date

    context "get reports ordered by object" do

      it "should return 'ASC' reports" do
        tipology = create(:tipology)
        signaler = create(:signaler)
        report1 = create(:report, :object => "abcd", :signaler => signaler, :tipology => tipology, :report_type => "Complaint")
        report2 = create(:report, :object => "dcba", :signaler => signaler, :tipology => tipology, :report_type => "Suggestion")
        get :index, params: {:search => {:object => "asc"}}
        expect(assigns(:reports).first).to eq(report1)
      end

      it "should return 'DESC' reports" do
        tipology = create(:tipology)
        signaler = create(:signaler)
        report1 = create(:report, :object => "abcd", :signaler => signaler, :tipology => tipology, :report_type => "Complaint")
        report2 = create(:report, :object => "dcba", :signaler => signaler, :tipology => tipology, :report_type => "Segnalation")
        get :index, params: {:search => {:object => "desc"}}
        expect(assigns(:reports).first).to eq(report2)
      end

    end # get reports ordered by object

    context "get nearby reports" do

      it "should return one report" do
        report = create(:report, :longitude => 41.900147, :latitude => 12.419942)
        get :index, params: {:search => {:address => "unknown", :longitude => 41.900754, :latitude => 12.420542, :unit => "m", :radius => 100}}
        expect(assigns(:reports).first).to eq(report)
      end

      it "should not return reports" do
        report = create(:report, :longitude => 41.900147, :latitude => 12.419942)
        get :index, params: {:search => {:address => "unknown", :longitude => 41.900754, :latitude => 12.420542, :unit => "m", :radius => 50}}
        expect(assigns(:reports).first).to be_nil
      end

    end # end get nearby reports

  end # end index action

  describe "show action" do

    it "returns http success" do
      report = create(:report)
      get :show, params: {id: report.to_param}
      expect(response).to have_http_status(:success)
    end

    it "render show template" do
      report = create(:report)
      get :show, params: {id: report.to_param}
      expect(response).to render_template(:show)
    end

    it "routes to #show" do
      expect(:get => "/reports/1").to route_to("reports#show", :id => "1")
    end

    it "assign report to @report intance variable" do
      report = create(:report)
      get :show, params: {id: report.to_param}
      expect(assigns(:report)).to eq(report)
    end

    it "create a new intance variable @obsevartions" do
      report = create(:report)
      get :show, params: {id: report.to_param}
      expect(assigns(:new_obervation)).to be_kind_of(Observation)
    end

    it "@report have rigth observations" do
      signaler = create(:signaler)
      report = create(:report, :signaler => signaler)
      observation1 = create(:observation, :signaler => signaler, :report => report)
      observation2 = create(:observation, :signaler => signaler, :report => report)
      get :show, params: {id: report.to_param}
      expect(assigns(:report).observations).to eq([observation1, observation2])
    end

  end

  describe "new action" do

    it "returns a insuccess response" do
      get :new, params: {}
      expect(response).not_to be_success
    end

    it "returns a success response if signaler loged in" do
      sign_in create(:signaler)
      get :new, params: {}
      expect(response).to be_success
    end

    it "render new template" do
      sign_in create(:signaler)
      get :new
      expect(response).to render_template(:new)
    end

    it "routes to #new" do
      sign_in create(:signaler)
      expect(:get => "/reports/new").to route_to("reports#new")
    end

    it "create a new intance variable @report" do
      sign_in create(:signaler)
      get :new
      expect(assigns(:report)).to be_kind_of(Report)
    end

  end

  describe "edit actions" do

    it "returns a success response" do
      signaler = create(:signaler)
      sign_in signaler
      report = create(:report, :signaler => signaler)
      get :edit, params: {id: report.to_param}
      expect(response).to be_success
    end

    it "render template edit" do
      signaler = create(:signaler)
      sign_in signaler
      report = create(:report, :signaler => signaler)
      get :edit, params: {id: report.to_param}
      expect(response).to render_template(:edit)
    end

    it "route to edit" do
      signaler = create(:signaler)
      sign_in signaler
      report = create(:report, :signaler => signaler)
      expect(:get => "/reports/1/edit").to route_to("reports#edit", :id => report.id.to_s)
    end

    it "assigns rigth report to edit" do
      signaler = create(:signaler)
      sign_in signaler
      report = create(:report, :signaler => signaler)
      get :edit, params: {id: report.to_param}
      expect(assigns(:report)).to eq(report)
    end

  end

  describe "create action" do

    it "routes to #create" do
      expect(:post => "/reports").to route_to("reports#create")
    end

    context "with valid params" do

      it "creates a new Report" do
        signaler = create(:signaler)
        tipology = create(:tipology)
        attributes(signaler, tipology)
        sign_in signaler
        expect {
          post :create, params: {report: @attributes}
        }.to change(Report, :count).by(1)
      end

      it "redirects to the created report" do
        signaler = create(:signaler)
        tipology = create(:tipology)
        attributes(signaler, tipology)
        sign_in signaler
        post :create, params: {report: @attributes}
        expect(response).to redirect_to(Report.last)
      end

    end

    context "with invalid params" do

      it "returns a success response (i.e. to display the 'new' template)" do
        sign_in create(:signaler)
        post :create, params: {report: {:object => "Object"}}
        expect(response).to be_success
      end

    end
  end

  describe "update action(PUT/PATCH)" do
    context "with valid params" do
      let(:new_attributes) {
        {:object => "New Object", :description => "a" * 400, :address => "Via Trionfale, 6751, 00100 Roma RM, Italia", :longitude => 41.93224524160291, :latitude => 12.440350581054645, :report_type => "Suggestion", :intervention_type => "Corrective"}
      }

      it "routes to #update via PUT" do
        expect(:put => "/reports/1").to route_to("reports#update", :id => "1")
      end

      it "routes to #update via PATCH" do
        expect(:patch => "/reports/1").to route_to("reports#update", :id => "1")
      end

      it "updates the requested report" do
        signaler = create(:signaler)
        tipology = create(:tipology)
        attributes(signaler, tipology)
        sign_in signaler
        report = Report.create(@attributes)
        put :update, params: {id: report.to_param, report: new_attributes}
        report.reload
        expect(report.object).to eq("New Object")
      end

      it "redirects to the report" do
        signaler = create(:signaler)
        tipology = create(:tipology)
        attributes(signaler, tipology)
        sign_in signaler
        report = Report.create(@attributes)
        put :update, params: {id: report.to_param, report: @attributes}
        expect(response).to redirect_to(report)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        signaler = create(:signaler)
        tipology = create(:tipology)
        attributes(signaler, tipology)
        sign_in signaler
        report = Report.create(@attributes)
        put :update, params: {id: report.to_param, report: {:report_type => "Object"}}
        expect(response).to be_success
      end
    end
  end

  describe "destroy action" do

    it "routes to #destroy" do
      expect(:delete => "/reports/1").to route_to("reports#destroy", :id => "1")
    end

    it "destroys the requested report" do
      signaler = create(:signaler)
      tipology = create(:tipology)
      attributes(signaler, tipology)
      sign_in signaler
      report = Report.create! @attributes
      expect {
        delete :destroy, params: {id: report.to_param}
      }.to change(Report, :count).by(-1)
    end

    it "redirects to the reports list" do
      signaler = create(:signaler)
      tipology = create(:tipology)
      attributes(signaler, tipology)
      sign_in signaler
      report = Report.create! @attributes
      delete :destroy, params: {id: report.to_param}
      expect(response).to redirect_to(reports_url)
    end

  end

end
