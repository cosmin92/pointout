require 'rails_helper'

RSpec.describe Signalers::PasswordsController, type: :routing do
    
    context "routing" do

        it "routes to #new" do
            expect(:get => "/signalers/password/new").to route_to("signalers/passwords#new")
        end

        it "routes to #edit" do
            expect(:get => "/signalers/password/edit").to route_to("signalers/passwords#edit")
        end

        it "routes to #update via PATCH" do
            expect(:patch => "/signalers/password").to route_to("signalers/passwords#update")
        end

        it "routes to #update via PUT" do
            expect(:put => "/signalers/password").to route_to("signalers/passwords#update")
        end

       it "routes to #create" do
            expect(:post => "/signalers/password").to route_to("signalers/passwords#create")
        end

    end
end