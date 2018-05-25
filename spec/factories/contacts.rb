FactoryBot.define do
  factory :contact do
    association :agency, factory: :agency, strategy: :create
    association :address_book, factory: :address_book, strategy: :create
  end
end
