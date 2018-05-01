require "rails_helper"

RSpec.describe StaticPagesController, type: :routing do
  context "routing" do

    it "routes to #home" do
      expect(:get => "/static_pages/home").to route_to("static_pages#home")
    end

    it "routes to root page" do
      expect(:get => "/").to route_to("static_pages#home")
    end

    it "routes to #about" do
      expect(:get => "/static_pages/about").to route_to("static_pages#about")
    end

  end
end
