require 'rails_helper'

RSpec.describe DashboardController, type: :controller do

  describe "GET #reports" do
    it "returns http success" do
      sign_in create(:forwarder)
      get :reports
      expect(response).to have_http_status(:success)
    end
  end

end
