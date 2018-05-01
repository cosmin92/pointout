require 'rails_helper'

RSpec.feature "signalers/passwords/new", type: :feature do

    it "renders the new password form" do
        visit "signalers/password/new"
        expect(find_field({:type => "email", :name=> "signaler[email]"})).not_to be_nil
    end
end