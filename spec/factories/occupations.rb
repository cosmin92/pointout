FactoryBot.define do
  factory :occupation do
    association :tipology, factory: :tipology, strategy: :create
    association :group, factory: :group, strategy: :create
  end
end
