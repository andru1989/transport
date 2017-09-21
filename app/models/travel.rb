class Travel < ApplicationRecord
  belongs_to :vehicle
  belongs_to :passenger

  validates :origin, :destination, presence: true
end
