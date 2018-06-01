require 'rails_helper'

RSpec.describe TipologiesController, type: :controller do

  def attributes(forwarder)
    @attributes = {
      :name => "a"*10,
      :description => "a"*400,
      :forwarder => forwarder,
      :logo => Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'images', 'illuminazione_stradale.png'), 'image/png')
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
      expect(:get => "/backend/tipologies" ).to route_to("tipologies#index")
    end

    it "assign tipologies to @tipology variable" do
      forwarder = create(:forwarder, :email => "ciao@gmail.com", :boss => true)
      tipology1 = create(:tipology, :forwarder => forwarder)
      tipology2 = create(:tipology, :forwarder => forwarder)
      sign_in forwarder
      get :index
      expect(assigns(:tipologies)).to eq([tipology1, tipology2])
    end

  end

  describe "GET #new" do

    it "returns a insuccess response" do
      get :new, params: {}
      expect(response).not_to be_success
    end

    it "returns a success response if forwarders boss loged in" do
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
      expect(:get => "backend/tipologies/new").to route_to("tipologies#new")
    end

    it "create a new intance variable @tipology" do
      sign_in create(:forwarder, :boss => true)
      get :new
      expect(assigns(:tipology)).to be_kind_of(Tipology)
    end

  end

  describe "edit action" do
    
    it "returns a success response if forwarders boss loged in" do
      forwarder = create(:forwarder, :boss => true)
      sign_in forwarder
      attributes(forwarder)
      tipology = Tipology.create(@attributes)
      get :edit, params: {id: tipology.to_param}
      expect(response).to be_success
    end

    it "render new template" do
      forwarder = create(:forwarder, :boss => true)
      sign_in forwarder
      attributes(forwarder)
      tipology = Tipology.create(@attributes)
      get :edit, params: {id: tipology.to_param}
      expect(response).to render_template(:edit)
    end

    it "routes to #edit" do
      forwarder = create(:forwarder, :boss => true)
      sign_in forwarder
      attributes(forwarder)
      tipology = Tipology.create(@attributes)
      expect(:get => "backend/tipologies/1/edit").to route_to("tipologies#edit", :id => tipology.id.to_param )
    end

  end

  describe "create action" do

    it "routes to #create" do
      expect(:post => "/backend/tipologies").to route_to("tipologies#create")
    end

    context "with valid params" do
      it "creates a new Tipology" do
        forwarder = create(:forwarder, :boss => true)
        sign_in forwarder
        attributes(forwarder)
        expect {
          post :create, params: {tipology: @attributes}
        }.to change(Tipology, :count).by(1)
      end

      it "redirects to the created tipology" do
        forwarder = create(:forwarder, :boss => true)
        sign_in forwarder
        attributes(forwarder)
        post :create, params: {tipology: @attributes}
        expect(response).to redirect_to(tipologies_path)
      end

    end

  end

  describe "update action" do

    context "with valid params" do

      let(:new_attributes) {
        {:name => "b"*10}
      }

      it "updates the requested tipology" do
        forwarder = create(:forwarder, :boss => true)
        sign_in forwarder
        attributes(forwarder)
        tipology = Tipology.create(@attributes)
        put :update, params: {id: tipology.to_param, tipology: new_attributes}
        tipology.reload
        expect(tipology.name).to eq("b"*10)
      end

      it "redirects to the tipology" do
        forwarder = create(:forwarder, :boss => true)
        sign_in forwarder
        attributes(forwarder)
        tipology = Tipology.create(@attributes)
        put :update, params: {id: tipology.to_param, tipology: @attributes}
        expect(response).to redirect_to(tipologies_path)
      end
    end

  end

  describe "DELETE #destroy" do

    it "routes to #destroy" do
      expect(:delete => "/backend/tipologies/1").to route_to("tipologies#destroy", :id => "1")
    end

    it "destroys the requested tipology" do
      forwarder = create(:forwarder, :boss => true)
      sign_in forwarder
      attributes(forwarder)
      tipology = Tipology.create(@attributes)
      expect {
        delete :destroy, params: {id: tipology.to_param}
      }.to change(Tipology, :count).by(-1)
    end

    it "redirects to the tipologies list" do
      forwarder = create(:forwarder, :boss => true)
      sign_in forwarder
      attributes(forwarder)
      tipology = Tipology.create(@attributes)
      delete :destroy, params: {id: tipology.to_param}
      expect(response).to redirect_to(tipologies_url)
    end
  end

end
