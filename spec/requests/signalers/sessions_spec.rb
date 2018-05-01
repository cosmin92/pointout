require 'rails_helper'

RSpec.describe "Signalers::SessionsController", type: :request do

    context "GET /sign_in" do
        it "have 200 http's status when request sign_in template" do
            get new_signaler_session_path
            expect(response).to have_http_status(200)
            end

        it "render sign_in template" do
            get new_signaler_session_path
            expect(response).to render_template(:new)
        end

        it "expect to sign in given valid credentials" do
            create(:signaler)
            get new_signaler_session_path
            post "/signalers/sign_in", :params => { :signaler => {:email => "mario.rossi@gmail.com", :password => "passwordsicura"} }

            follow_redirect!

            expect(response.body).to include("Signed in successfully.")
        end

        it "expect to not sign in given invalid credentials" do
            create(:signaler)
            get new_signaler_session_path
            post "/signalers/sign_in", :params => { :signaler => {:email => "mario.rossimail.com", :password => "passwordsicura"} }

            expect(response.body).to include("Invalid Email or password.")
        end
    end

    context "DELETE /sign_out" do
        it "expect to non have access to destroy session if non signed in" do
            delete "/signalers/sign_out"
            expect(response).to have_http_status(302)
        end

        it "expect to destroy session if signed in" do
            sign_in create(:signaler)
            get root_path
            delete "/signalers/sign_out"
            follow_redirect!
            expect(response).to have_http_status(200)

            get edit_signaler_registration_path
            expect(response).to have_http_status(302)
        end
    end
end