require 'rails_helper'


RSpec.describe AddressBooksController, type: :controller do


  def attributes(forwarder)
    @attributes = { :name => "Cos’è Lorem Ipsum?", :note=> "a"*400, :forwarder_id => forwarder.id, :group_id => forwarder.group.id}
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
      expect(:get => "/backend/address_books" ).to route_to("address_books#index")
    end
    
    it "assign address_books to @address_books variable" do
      forwarder = create(:forwarder, :email => "ciao@gmail.com", :boss => true)
      ab1 = create(:address_book, :forwarder => forwarder, :group => forwarder.group)
      ab2 = create(:address_book, :forwarder => forwarder, :group => forwarder.group)
      sign_in forwarder
      get :index
      expect(assigns(:address_books)).to eq([ab1, ab2])
    end

  end

  describe "new action" do
    it "returns a insuccess response" do
      get :new, params: {}
      expect(response).not_to be_success
    end

    it "returns a success response if signaler loged in" do
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
      expect(:get => "/backend/address_books/new").to route_to("address_books#new")
    end

    it "create a new intance variable @address_book" do
      sign_in create(:forwarder, :boss => true)
      get :new
      expect(assigns(:address_book)).to be_kind_of(AddressBook)
    end
  end

  describe "edit action" do

    it "returns a success response" do
      forwarder = create(:forwarder, :boss => true)
      sign_in forwarder
      address_book = create(:address_book, :forwarder => forwarder)
      get :edit, params: {id: address_book.to_param}
      expect(response).to be_success
    end

    it "render template edit" do
      forwarder = create(:forwarder, :boss => true)
      sign_in forwarder
      address_book = create(:address_book, :forwarder => forwarder)
      get :edit, params: {id: address_book.to_param}
      expect(response).to render_template(:edit)
    end

    it "route to edit" do
      forwarder = create(:forwarder, :boss => true)
      sign_in forwarder
      address_book = create(:address_book, :forwarder => forwarder)
      get :edit, params: {id: address_book.to_param}
      expect(:get => "/backend/address_books/1/edit").to route_to("address_books#edit", :id => address_book.id.to_s)
    end

    it "assigns rigth address_book to edit" do
      forwarder = create(:forwarder, :boss => true)
      sign_in forwarder
      address_book = create(:address_book, :forwarder => forwarder)
      get :edit, params: {id: address_book.to_param}
      expect(assigns(:address_book)).to eq(address_book)
    end

  end

  describe "create action" do

    it "routes to #create" do
      expect(:post => "/backend/address_books").to route_to("address_books#create")
    end

    context "with valid params" do
      it "creates a new AddressBook" do
        forwarder = create(:forwarder, :boss => true)
        sign_in forwarder
        attributes(forwarder)
        expect {
          post :create, params: {address_book: @attributes}
        }.to change(AddressBook, :count).by(1)
      end

      it "redirects to the created address_book" do
        forwarder = create(:forwarder, :boss => true)
        sign_in forwarder
        attributes(forwarder)
        post :create, params: {address_book: @attributes}
        expect(response).to redirect_to(address_books_url)
      end
    end

  end

  describe "update action " do

    it "routes to #update via PUT" do
      expect(:put => "/backend/address_books/1").to route_to("address_books#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/backend/address_books/1").to route_to("address_books#update", :id => "1")
    end

    context "with valid params" do
      let(:new_attributes) {
        {:name => "b"*10}
      }

      it "updates the requested address_book" do
        forwarder = create(:forwarder, :boss => true)
        sign_in forwarder
        attributes(forwarder)
        address_book = AddressBook.create! @attributes
        put :update, params: {id: address_book.to_param, address_book: new_attributes}
        address_book.reload
        expect(address_book.name).to eq("b"*10)
      end

      it "redirects to the address_book" do
        forwarder = create(:forwarder, :boss => true)
        sign_in forwarder
        attributes(forwarder)
        address_book = AddressBook.create! @attributes
        put :update, params: {id: address_book.to_param, address_book: @attributes}
        expect(response).to redirect_to(address_books_path)
      end
    end

  end

  describe "destroy action" do
    it "destroys the requested address_book" do
      forwarder = create(:forwarder, :boss => true)
      sign_in forwarder
      attributes(forwarder)
      address_book = AddressBook.create! @attributes
      expect {
        delete :destroy, params: {id: address_book.to_param}
      }.to change(AddressBook, :count).by(-1)
    end

    it "redirects to the address_books list" do
      forwarder = create(:forwarder, :boss => true)
      sign_in forwarder
      attributes(forwarder)
      address_book = AddressBook.create! @attributes
      delete :destroy, params: {id: address_book.to_param}
      expect(response).to redirect_to(address_books_url)
    end
  end

end
