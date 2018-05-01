require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe "GET /home" do
    it "have 200 http's status when request home template" do
      get static_pages_home_path
      expect(response).to have_http_status(200)
    end

    it "render home template" do
      get static_pages_home_path
      expect(response).to render_template(:home)
    end
  end

   describe "GET /about" do
    it "have 200 http's status when request about template" do
      get static_pages_about_path
      expect(response).to have_http_status(200)
    end

    it "render about template" do
      get static_pages_about_path
      expect(response).to render_template(:about)
    end
  end
end