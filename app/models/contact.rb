class Contact < ApplicationRecord
  # Associations
  belongs_to :agency
  belongs_to :address_book
end
