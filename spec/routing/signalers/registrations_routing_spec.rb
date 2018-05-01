require 'rails_helper'

RSpec.describe Signalers::RegistrationsController, type: :routing do
    context "routing" do

        it "routes to #sign_up" do
            expect(:get => "/signalers/sign_up").to route_to("signalers/registrations#new")
        end

        it "routes to #edit" do
            expect(:get => "/signalers/edit").to route_to("signalers/registrations#edit")
        end

        it "routes to #cancel" do
            expect(:get => "/signalers/cancel").to route_to("signalers/registrations#cancel")
        end

        it "routes to #create" do
            expect(:post => "/signalers").to route_to("signalers/registrations#create")
        end

        it "routes to #update via PUT" do
            expect(:put => "/signalers").to route_to("signalers/registrations#update")
        end

        it "routes to #update via PATCH" do
            expect(:patch => "/signalers").to route_to("signalers/registrations#update")
        end

        it "routes to #destroy" do
            expect(:delete => "/signalers").to route_to("signalers/registrations#destroy")
        end

         it "routes to #timeline" do
            expect(:get => "/signalers/timeline").to route_to("signalers/registrations#timeline")
        end

        it "routes to #timeline" do
            expect(:get => "/signalers/profile").to route_to("signalers/registrations#profile")
        end
    end
end