class Intervention < ApplicationRecord
  # Associations
  belongs_to :signaler
  belongs_to :report

  # Validations
  validates :intervention_type, inclusion: { in: ["Ordinary", "Immediate"] }
end
