require 'rails_helper'

RSpec.describe Signalers::SessionsController, type: :routing do
    context "routing" do

        it "routes to #sign_in" do
            expect(:get => "/signalers/sign_in").to route_to("signalers/sessions#new")
        end

        it "routes to #create" do
            expect(:post => "/signalers/sign_in").to route_to("signalers/sessions#create")
        end

        it "routes to #sign_out" do
            expect(:get=> "/signalers/sign_out").to route_to("signalers/sessions#destroy")
        end
    end
end