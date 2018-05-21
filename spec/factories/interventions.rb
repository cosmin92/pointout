FactoryBot.define do
  factory :intervention do
    intervention_type "Ordinary"
    association :report, factory: :report, strategy: :create
    association :signaler, factory: :signaler, :email => "mail@gmail.com", :phone => "123456098", :id_card_number => "AH1234098", strategy: :create
  end
end
