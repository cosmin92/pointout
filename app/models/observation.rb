class Observation < ApplicationRecord
  mount_uploaders :images, ImageUploader
  serialize :images, JSON

  acts_as_taggable

  #Relations
  belongs_to :signaler
  belongs_to :report

  # Validations
  validates :content, presence: true, length: {minimum: 2, maximum: 5000}
  validates_integrity_of :images
  validates_processing_of :images
end
