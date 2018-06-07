FactoryBot.define do
  factory :address_book do
    name "Enti per problemi di Illuminazione Pubblica"
    note "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas quis consectetur neque. Curabitur hendrerit nulla neque, quis molestie eros posuere non. Morbi convallis turpis et maximus iaculis. Praesent quis urna magna. Cras congue metus quis odio laoreet condimentum. Phasellus sit amet felis pellentesque, vestibulum lectus non, sollicitudin tortor. Nunc condimentum facilisis dui, sed facilisis lacus lacinia non."

    association :forwarder, :email => "address_book@gmail.com", factory: :forwarder, strategy: :create
    association :group, factory: :group, strategy: :create
  end
end
