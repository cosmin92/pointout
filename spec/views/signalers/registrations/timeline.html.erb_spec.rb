require 'rails_helper'

RSpec.feature "signalers/registrations/timeline", type: :feature do

    xit "renders signaler timeline" do
        sign_in create(:signaler)
        visit "signalers/timeline"
        expect(find_field({:type => "text", :name=> "signaler[first_name]"})).not_to be_nil
    end
end