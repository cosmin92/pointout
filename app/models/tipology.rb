class Tipology < ApplicationRecord
    mount_uploader :logo, LogoUploader
    # Assocaitions
    # has_many :reports
    # has_many :occupations
    # has_many :groups, through: :occupations
    # belongs_to :forwarder

    belongs_to :parent, class_name: "Tipology", required: false
    has_many :children, class_name: "Tipology", foreign_key: "parent_id"

    # Validations
    validates :name, presence: true, length: { minimum: 3, maximum: 50 }
    validates :description, presence: true
    validates :logo, presence: true

    validates_integrity_of  :logo
    validates_processing_of :logo

end
