FactoryBot.define do
  factory :forwarder do
    first_name "Mario"
    last_name "Rossi"
    email "mario.rossi@gmail.com"
    password "passwordsicura"
    password_confirmation 'passwordsicura'
    profile_picture { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'images', 'profile_picture.png'), 'image/png') }
    association :group, factory: :group, strategy: :create
  end
end
