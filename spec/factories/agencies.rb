FactoryBot.define do
  factory :agency do
    name "Anas S.p.A. Direzione Centrale"
    phone "0644461"
    email "anas.direzionecentrale@gmail.com"
    fax "0644461"
    street "via Monzambano"
    number "10"
    city "Roma"
    zip_code "00159"
    note "Suspendisse pretium, lectus non luctus imperdiet, metus dolor vulputate sem, quis commodo erat nulla in orci. Suspendisse ornare sed risus nec tincidunt. Nam rhoncus ante eu nulla suscipit ornare ac quis urna. Duis convallis ante urna, et dictum sapien rutrum quis."
    web_site_url "http://www.stradeanas.it/it"

    association :forwarder, :email => "agency@gmail.com", factory: :forwarder, strategy: :create
  end
end
