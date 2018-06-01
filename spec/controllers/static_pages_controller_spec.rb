require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  describe "GET #home" do

    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end

    it "render home template" do
      get :home
      expect(response).to render_template(:home)
    end

    it "should rout to root" do
      expect(:get => "/" ).to route_to("static_pages#home")
    end

  end # end home

end
