require 'rails_helper'

RSpec.feature "signalers/registrations/profile", type: :feature do

    xit "renders signaler informations" do
        sign_in create(:signaler)
        visit "signalers/profile"
        expect(find_field({:type => "text", :name=> "signaler[first_name]"})).not_to be_nil
    end
end