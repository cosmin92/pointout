class Signaler < ApplicationRecord

  mount_uploader :profile_picture, ProfilePictureUploader

  # Include default devise modules.
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  # Include oauth devise modules.
  devise :omniauthable, omniauth_providers: [:amazon, :github, :google_oauth2]

  validates :release_date, :expiration_date, presence: :true
  validates :first_name, presence: true, length: {minimum: 1, maximum: 30}
  validates :last_name, presence: true, length: {minimum: 1, maximum: 30}
  validates :phone, presence: true, length: {minimum: 4, maximum: 15}
  validates :street, presence: true, length: {minimum: 5, maximum: 50}
  validates :number, presence: true, length: {minimum: 1, maximum: 5}
  validates :city, presence: true, length: {minimum: 2, maximum: 30}
  validates :zip_code, presence: true, length: {minimum: 1, maximum: 10}
  validates :id_card_number, presence: true, length: {minimum: 8, maximum: 20}
  validates :municipality, presence: true, length: {minimum: 2, maximum: 30}
  validate :expiration_date_cannot_be_earlier_than_release_date

  validates_integrity_of :profile_picture
  validates_processing_of :profile_picture

  # Associations
  has_many :reports, dependent: :destroy
  has_many :observations, :dependent => :destroy
  has_many :interventions, :dependent => :destroy

  # public methods
  def full_name
    self.first_name + " " + self.last_name
  end

  def self.find_signaler_email(access_token)
    data = access_token.info
    signaler = Signaler.where(email: data['email']).first
    return signaler
  end

  private

  def expiration_date_cannot_be_earlier_than_release_date
    if :expiration_date > :release_date
      errors.add(:expiration_date, "can't be earler than release date")
      errors.add(:release_date, "can't be greater than expiration date")
    end
  end

end
