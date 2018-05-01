require 'rails_helper'

RSpec.describe "Signalers::RegistrationsController", type: :request do

    context  "GET #new" do
        it "have 200 http's status when request new template" do
            get new_signaler_password_path
            expect(response).to have_http_status(200)
        end

        it "render new template" do
            get new_signaler_password_path
            expect(response).to render_template(:new)
        end
    end

end