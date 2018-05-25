class Forwarder < ApplicationRecord

  mount_uploader :profile_picture, ProfilePictureUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  # Associations
  belongs_to :group
  has_many :tipologies
  has_many :reports
  has_many :address_books
  has_many :agencies
  has_many :notices

  # Validations
  validates :first_name,  presence: true, length: { minimum: 1, maximum: 30 }
  validates :last_name,  presence: true, length: { minimum: 1, maximum: 30 }
  validates_integrity_of  :profile_picture
  validates_processing_of :profile_picture

  # public methods
  def full_name
    self.first_name + " " + self.last_name
  end
end
