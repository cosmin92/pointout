class Agency < ApplicationRecord
    # Associations
    belongs_to :forwarder
    has_many :reports
    has_many :contacts
    has_many :address_books, through: :contacts

    # Validations
    validates :name, presence: true, length: { minimum: 4, maximum: 50 }
    validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/ }
    validates :street, presence: true, length: { minimum: 5, maximum: 50 }
    validates :number, presence: true, length: { minimum: 1, maximum: 5 }
    validates :city, presence: true, length: { minimum: 2, maximum: 30 }
    validates :zip_code, presence: true, length: { minimum: 1, maximum: 10 }
    validates :phone, length: { minimum: 4, maximum: 15 }
    validates :note, length: { maximum: 500 }

end
