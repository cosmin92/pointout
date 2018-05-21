FactoryBot.define do
  factory :report do
    object "Cos’è Lorem Ipsum?"
    description "Lorem Ipsum è un testo segnaposto utilizzato nel settore della tipografia e della stampa. Lorem Ipsum è considerato il testo segnaposto standard sin dal sedicesimo secolo, quando un anonimo tipografo prese una cassetta di caratteri e li assemblò per preparare un testo campione."

    address "Via Trionfale, 6751, 00100 Roma RM, Italia"
    longitude 41.93224524160291
    latitude 12.440350581054645

    report_type "Suggestion"
    intervention_type "Corrective"

    association :signaler, factory: :signaler, strategy: :create
    association :tipology, factory: :tipology, strategy: :create
  end
end
