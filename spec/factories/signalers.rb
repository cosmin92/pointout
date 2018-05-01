FactoryBot.define do
  factory :signaler do
    first_name "Mario"
    last_name "Rossi"
    email "mario.rossi@gmail.com"
    phone "1234567890"
    password "passwordsicura"
    password_confirmation 'passwordsicura'
    profile_picture { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'images', 'profile_picture.png'), 'image/png') }

    #residence
    street "via Giolitti"
    number "35A"
    city "Udine"
    zip_code "00167"

    # identity card
    id_card_number "AO1234567"
    municipality "Formia(LT)"
    expiration_date { Date.new(2015, 3, 1) }
    release_date { Date.new(2015, 3, 1) }
  end
end
