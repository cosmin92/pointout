class Notice < ApplicationRecord
  # Associations
  belongs_to :forwarder
  belongs_to :group

  # Validations
  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :content, presence: true, length: {minimum: 3, maximum: 1000}
  validates :posting_date, presence: true
  validates :expiration_date, presence: true
  validates :notice_type, presence: true, inclusion: {in: ["Information", "Warning", "Obbligation", "Result"]}
  validate :expiration_date_cannot_be_earlier_than_posting_date

  private

  def expiration_date_cannot_be_earlier_than_posting_date
    if :expiration_date > :posting_date
      errors.add(:expiration_date, "can't be earler than posting date")
      errors.add(:posting_date, "can't be greater than expiration date")
    end
  end
end
