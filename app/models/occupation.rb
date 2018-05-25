class Occupation < ApplicationRecord
  # Associations
  belongs_to :group
  belongs_to :tipology
end
