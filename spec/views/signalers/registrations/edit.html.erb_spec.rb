require 'rails_helper'

RSpec.feature "signalers/registrations/edit", type: :feature do
  include Devise::Test::ControllerHelpers
    it "renders the edit signaler form" do
        signaler = create(:signaler)
        report = create(:report, :signaler => signaler)
        sign_in signaler
        assign(:resource, report)
        render
        expect(find_field({:type => "text", :name=> "signaler[first_name]"})).not_to be_nil
        expect(find_field({:type => "text", :name=> "signaler[last_name]"})).not_to be_nil
        expect(find_field({:type => "tel", :name=> "signaler[phone]"})).not_to be_nil
        expect(find_field({:type => "email", :name=> "signaler[email]"})).not_to be_nil
        expect(find_field({:type => "password", :name=> "signaler[password]"})).not_to be_nil
        expect(find_field({:type => "password", :name=> "signaler[password_confirmation]"})).not_to be_nil
        expect(find_field({:type => "password", :name=> "signaler[current_password]"})).not_to be_nil
        expect(find_field({:type => "text", :name=> "signaler[street]"})).not_to be_nil
        expect(find_field({:type => "text", :name=> "signaler[number]"})).not_to be_nil
        expect(find_field({:type => "text", :name=> "signaler[city]"})).not_to be_nil
        expect(find_field({:type => "text", :name=> "signaler[zip_code]"})).not_to be_nil
        expect(find_field({:type => "text", :name=> "signaler[id_card_number]"})).not_to be_nil
        expect(find_field({:type => "text", :name=> "signaler[municipality]"})).not_to be_nil
        expect(find_field({:type => "date", :name=> "signaler[release_date]"})).not_to be_nil
        expect(find_field({:type => "date", :name=> "signaler[expiration_date]"})).not_to be_nil
        expect(find_field({:type => "file", :name=> "signaler[profile_picture]"})).not_to be_nil
    end
end