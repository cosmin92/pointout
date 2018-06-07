require 'rails_helper'

RSpec.describe NoticesController, type: :controller do

  include Devise::Test::ControllerHelpers

  def attributes(forwarder)
    @attributes = {:title => "a" * 10, :content => "a" * 400, :notice_type => "Information", :posting_date => Date.new(2015, 3, 1), :expiration_date => Date.new(2018, 3, 1), :group => forwarder.group, :forwarder => forwarder}
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
      expect(:get => "/backend/notices").to route_to("notices#index")
    end

    it "assign notices to @notice variable" do
      forwarder = create(:forwarder, :email => "ciao@gmail.com", :boss => true)
      notice1 = create(:notice, :forwarder => forwarder, :group => forwarder.group)
      notice2 = create(:notice, :forwarder => forwarder, :group => forwarder.group)
      sign_in forwarder
      get :index
      expect(assigns(:notices)).to eq([notice1, notice2])
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
      expect(:get => "backend/notices/new").to route_to("notices#new")
    end

    it "create a new intance variable @notice" do
      sign_in create(:forwarder, :boss => true)
      get :new
      expect(assigns(:notice)).to be_kind_of(Notice)
    end

  end

  describe "edit action" do

    it "returns a success response if forwarders boss loged in" do
      forwarder = create(:forwarder, :boss => true)
      sign_in forwarder
      attributes(forwarder)
      notice = Notice.create(@attributes)
      get :edit, params: {id: notice.to_param}
      expect(response).to be_success
    end

    it "render new template" do
      forwarder = create(:forwarder, :boss => true)
      sign_in forwarder
      attributes(forwarder)
      notice = Notice.create(@attributes)
      get :edit, params: {id: notice.to_param}
      expect(response).to render_template(:edit)
    end

    it "routes to #edit" do
      forwarder = create(:forwarder, :boss => true)
      sign_in forwarder
      attributes(forwarder)
      notice = Notice.create(@attributes)
      expect(:get => "backend/notices/1/edit").to route_to("notices#edit", :id => notice.id.to_param)
    end

  end

  describe "create action" do

    it "routes to #create" do
      expect(:post => "/backend/notices").to route_to("notices#create")
    end

    context "with valid params" do
      it "creates a new Notice" do
        forwarder = create(:forwarder, :boss => true)
        sign_in forwarder
        attributes(forwarder)
        expect {
          post :create, params: {notice: @attributes}
        }.to change(Notice, :count).by(1)
      end

      it "redirects to the created notice" do
        forwarder = create(:forwarder, :boss => true)
        sign_in forwarder
        attributes(forwarder)
        post :create, params: {notice: @attributes}
        expect(response).to redirect_to(notices_path)
      end

    end

  end

  describe "PUT #update" do

    context "with valid params" do

      let(:new_attributes) {
        {:title => "b" * 10}
      }

      it "updates the requested notice" do
        forwarder = create(:forwarder, :boss => true)
        sign_in forwarder
        attributes(forwarder)
        notice = Notice.create(@attributes)
        put :update, params: {id: notice.to_param, notice: new_attributes}
        notice.reload
        expect(notice.title).to eq("b" * 10)
      end

      it "redirects to the notice" do
        forwarder = create(:forwarder, :boss => true)
        sign_in forwarder
        attributes(forwarder)
        notice = Notice.create(@attributes)
        put :update, params: {id: notice.to_param, notice: @attributes}
        expect(response).to redirect_to(notices_path)
      end
    end

  end

  describe "DELETE #destroy" do

    it "routes to #destroy" do
      expect(:delete => "/backend/notices/1").to route_to("notices#destroy", :id => "1")
    end

    it "destroys the requested notice" do
      forwarder = create(:forwarder, :boss => true)
      sign_in forwarder
      attributes(forwarder)
      notice = Notice.create(@attributes)
      expect {
        delete :destroy, params: {id: notice.to_param}
      }.to change(Notice, :count).by(-1)
    end

    it "redirects to the notices list" do
      forwarder = create(:forwarder, :boss => true)
      sign_in forwarder
      attributes(forwarder)
      notice = Notice.create(@attributes)
      delete :destroy, params: {id: notice.to_param}
      expect(response).to redirect_to(notices_url)
    end
  end

end
