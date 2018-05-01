require 'rails_helper'

RSpec.feature "signalers/sign_in", type: :feature do

    it "renders the login form" do
        visit "signalers/sign_in"
        expect(find_field({:type => "email", :name=> "signaler[email]"})).not_to be_nil
        expect(find_field({:type => "password", :name=> "signaler[password]"})).not_to be_nil
    end
end