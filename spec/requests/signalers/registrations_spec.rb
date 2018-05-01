require 'rails_helper'

RSpec.describe "Signalers::RegistrationsController", type: :request do

  context  "GET /sign_up" do
    it "have 200 http's status when request sign_up template" do
      get new_signaler_registration_path
      expect(response).to have_http_status(200)
    end

    it "render sign_up template" do
      get new_signaler_registration_path
      expect(response).to render_template(:new)
    end

    it "given valid attributes creates a Signaler and redirects to the profile page" do
        get new_signaler_registration_path
        post "/signalers", :params => { :signaler => attributes_for(:signaler) }

        follow_redirect!

        expect(response).to render_template("registrations/profile")
        expect(response.body).to include("Welcome! You have signed up successfully.")
    end

    it "given invalid attributes render sign_up template again and show error message" do
        get new_signaler_registration_path
        post "/signalers", :params => { :signaler => attributes_for(:signaler, :first_name => "") }

        expect(response).to render_template(:new)
        expect(response.body).to include("First name can&#39;t be blank")
    end
  end

  context  "GET /edit" do

    it "have 200 http's status when signaler is signed in and request edit template" do
      sign_in create(:signaler)
      get edit_signaler_registration_path
      expect(response).to have_http_status(200)
    end

    it "have 302 http's status when signaler is not signed in and request edit template" do
      get edit_signaler_registration_path
      expect(response).to have_http_status(302)
    end

    it "render edit template when signaler is signed in" do
      sign_in create(:signaler)
      get edit_signaler_registration_path
      expect(response).to render_template(:edit)
    end

    it "given valid attributes updete signaler profile and redirects to the profile page via PUT" do
      sign_in create(:signaler, :first_name => "Pippo")
      get edit_signaler_registration_path
      put "/signalers", :params => { :signaler => {:first_name => "Pluto", :current_password => "passwordsicura"}  }
      
      follow_redirect!
      
      expect(response).to render_template("registrations/profile")
      expect(response.body).to include("Pluto")
    end

    it "given valid attributes updete signaler profile and redirects to the profile page via PATCH" do
      sign_in create(:signaler, :first_name => "Pippo")
      get edit_signaler_registration_path
      patch "/signalers", :params => { :signaler => {:first_name => "Pluto", :current_password => "passwordsicura"}  }
      
      follow_redirect!
      
      expect(response).to render_template("registrations/profile")
      expect(response.body).to include("Pluto")
    end

    it "given invalid attributes render sign_up template again and show error message" do
      sign_in create(:signaler, :first_name => "Pippo")
      get edit_signaler_registration_path
      put "/signalers", :params => { :signaler => {:first_name => "Pluto"} }

      expect(response).to render_template(:edit)
      expect(response.body).to include("Current password can&#39;t be blank")
    end
  end

  context "DELETE /profile" do
    it "expect to non have access to destroy profile if non signed in" do
      delete "/signalers"
      expect(response).to have_http_status(302)
    end

    it "expect to destroy profile if signed in" do
      sign_in create(:signaler)
      delete "/signalers"
      follow_redirect!
      expect(response).to have_http_status(200)
    end
  end

  context "GET /profile" do
    it "have 200 http's status when request profile template" do
      sign_in create(:signaler)
      get signalers_profile_path
      expect(response).to have_http_status(200)
    end

    it "render profile template" do
      sign_in create(:signaler)
      get signalers_profile_path
      expect(response).to render_template(:profile)
    end

    it "not have access to profile if not signed in" do
      get signalers_profile_path
      expect(response).to have_http_status(302)
    end
  end

  context "GET /timeline" do
    it "have 200 http's status when request timeline template" do
      sign_in create(:signaler)
      get signalers_timeline_path
      expect(response).to have_http_status(200)
    end

    it "render timeline template" do
      sign_in create(:signaler)
      get signalers_timeline_path
      expect(response).to render_template(:timeline)
    end

    it "not have access to timeline if not signed in" do
      get signalers_timeline_path
      expect(response).to have_http_status(302)
    end
  end
end