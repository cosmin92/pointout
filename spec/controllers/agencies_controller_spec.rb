require 'rails_helper'

RSpec.describe AgenciesController, type: :controller do

  def attributes(forwarder)
    @attributes = {
      :name => "Agency name",
      :phone => "34345345345",
      :fax => "34345345345",
      :email => "agency@gmail.com",
      :note => "a"*400,
      :street => "Via Trionfale",
      :number => "6751",
      :city => "Roma",
      :zip_code => "00167",
      :web_site_url => 41.93224524160291,
      :forwarder_id => forwarder.id
    }
  end

  describe "index action" do
    
    it "returns http success" do
      sign_in create(:forwarder)
      get :index
      expect(response).to have_http_status(:success)
    end

    it "render index template" do
      sign_in create(:forwarder)
      get :index
      expect(response).to render_template(:index)
    end

    it "should rout to reports" do
      expect(:get => "/backend/agencies" ).to route_to("agencies#index")
    end

    it "returns a success response" do
      forwarder = create(:forwarder)
      attributes(forwarder)
      sign_in forwarder
      agency = Agency.create! @attributes
      get :index, params: {}
      expect(response).to be_success
    end

    it "assign agencies to @agencies variable" do
      forwarder = create(:forwarder, :email => "ciao@gmail.com", :boss => true)
      agency1 = create(:agency, :forwarder => forwarder)
      agency2 = create(:agency, :forwarder => forwarder)
      sign_in forwarder
      get :index
      expect(assigns(:agencies)).to eq([agency1, agency2])
    end

  end

  describe "show action" do
    
    it "returns a success response" do
      forwarder = create(:forwarder)
      attributes(forwarder)
      sign_in forwarder
      agency = Agency.create! @attributes
      get :show, params: {id: agency.to_param}
      expect(response).to be_success
    end

    it "render show template" do
      forwarder = create(:forwarder)
      attributes(forwarder)
      sign_in forwarder
      agency = Agency.create! @attributes
      get :show, params: {id: agency.to_param}
      expect(response).to render_template(:show)
    end

    it "routes to #show" do
      expect(:get => "/backend/agencies/1").to route_to("agencies#show", :id => "1")
    end

    it "assign agencies to @agencies intance variable" do
      forwarder = create(:forwarder)
      attributes(forwarder)
      sign_in forwarder
      agency = Agency.create! @attributes
      get :show, params: {id: agency.to_param}
      expect(assigns(:agency)).to eq(agency)
    end

  end

  describe "GET #new" do
    it "returns a insuccess response" do
      get :new, params: {}
      expect(response).not_to be_success
    end

    it "returns a success response if forwarder loged in" do
      sign_in create(:forwarder)
      get :new, params: {}
      expect(response).to be_success
    end

    it "render new template" do
      sign_in create(:forwarder)
      get :new
      expect(response).to render_template(:new)
    end

    it "routes to #new" do
      sign_in create(:forwarder)
      expect(:get => "/backend/agencies/new").to route_to("agencies#new")
    end

    it "create a new intance variable @report" do
      sign_in create(:forwarder)
      get :new
      expect(assigns(:agency)).to be_kind_of(Agency)
    end
  end

  describe "edit action" do

    it "returns a success response" do
      forwarder = create(:forwarder)
      sign_in forwarder
      agency = create(:agency, :forwarder => forwarder)
      get :edit, params: {id: agency.to_param}
      expect(response).to be_success
    end

    it "render template edit" do
      forwarder = create(:forwarder)
      sign_in forwarder
      agency = create(:agency, :forwarder => forwarder)
      get :edit, params: {id: agency.to_param}
      expect(response).to render_template(:edit)
    end

    it "route to edit" do
      forwarder = create(:forwarder)
      sign_in forwarder
      agency = create(:agency, :forwarder => forwarder)
      expect(:get => "/backend/agencies/1/edit").to route_to("agencies#edit", :id => agency.id.to_s)
    end


    it "assigns rigth report to edit" do
      signaler = create(:signaler)
      forwarder = create(:forwarder)
      sign_in forwarder
      agency = create(:agency, :forwarder => forwarder)
      get :edit, params: {id: agency.to_param}
      expect(assigns(:agency)).to eq(agency)
    end

  end

  describe "create action" do
    
    it "routes to #create" do
      expect(:post => "/backend/agencies").to route_to("agencies#create")
    end

    context "with valid params" do

      it "creates a new Agency" do
        forwarder = create(:forwarder)
        sign_in forwarder
        attributes(forwarder)
        expect {
          post :create, params: {agency: @attributes}
        }.to change(Agency, :count).by(1)
      end

      it "redirects to the created agency" do
        forwarder = create(:forwarder)
        sign_in forwarder
        attributes(forwarder)
        post :create, params: {agency: @attributes}
        expect(response).to redirect_to(Agency.last)
      end
    end

  end

  describe "update action" do

    it "routes to #update via PUT" do
      expect(:put => "/backend/agencies/1").to route_to("agencies#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/backend/agencies/1").to route_to("agencies#update", :id => "1")
    end

    context "with valid params" do

      let(:new_attributes) {
        {:name => "b"*10}
      }

      it "updates the requested agency" do
        forwarder = create(:forwarder)
        sign_in forwarder
        attributes(forwarder)
        agency = Agency.create! @attributes
        put :update, params: {id: agency.to_param, agency: new_attributes}
        agency.reload
        expect(agency.name).to eq("b"*10)
      end

      it "redirects to the agency" do
        forwarder = create(:forwarder)
        sign_in forwarder
        attributes(forwarder)
        agency = Agency.create! @attributes
        put :update, params: {id: agency.to_param, agency: @attributes}
        expect(response).to redirect_to(agency)
      end
    end

  end

  describe "DELETE #destroy" do

    it "routes to #destroy" do
      expect(:delete => "/backend/agencies/1").to route_to("agencies#destroy", :id => "1")
    end

    it "destroys the requested agency" do
      forwarder = create(:forwarder)
      sign_in forwarder
      attributes(forwarder)
      agency = Agency.create! @attributes
      expect {
        delete :destroy, params: {id: agency.to_param}
      }.to change(Agency, :count).by(-1)
    end

    it "redirects to the agencies list" do
      forwarder = create(:forwarder)
      sign_in forwarder
      attributes(forwarder)
      agency = Agency.create! @attributes
      delete :destroy, params: {id: agency.to_param}
      expect(response).to redirect_to(agencies_url)
    end
  end

end
