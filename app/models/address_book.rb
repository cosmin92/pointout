class AddressBook < ApplicationRecord
    # Associations
    belongs_to :group
    belongs_to :forwarder
    has_many :contacts, dependent: :destroy
    has_many :agencies, through: :contacts

    # Validations
    validates :name, presence: true, length: { minimum: 4, maximum: 50 }
    validates :note, length: { maximum: 500 }
end
