class Group < ApplicationRecord
  mount_uploader :logo, LogoUploader

  # Associations
  has_many :occupations, :dependent => :destroy
  has_many :tipologies, through: :occupations
  has_many :forwarders
  has_many :address_books, dependent: :destroy
  has_many :notices, dependent: :destroy

  belongs_to :parent, class_name: "Group", required: false
  has_many :children, class_name: "Group", foreign_key: "parent_id"

  # Validations
  validates :name, presence: true, length: {minimum: 3, maximum: 50}
  validates :description, presence: true
  validates :logo, presence: true

  validates_integrity_of :logo
  validates_processing_of :logo
end
