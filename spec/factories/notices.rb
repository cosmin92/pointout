FactoryBot.define do
  factory :notice do
    title "Nuova Rubrica nella lista"
    content "é stata aggiunta una nuova rubbrica nella lista. Gli elemento di questa rubbrica sono riservati escusivamente per l'inltro dei report appartenente alla tipologia Ambientale"
    posting_date {Date.new(2015, 3, 1)}
    expiration_date {Date.new(2018, 3, 1)}
    notice_type "Information"

    association :group, factory: :group, strategy: :create
    association :forwarder, :email => "mail@gmail.com", :boss => true, factory: :forwarder, strategy: :create
  end
end
