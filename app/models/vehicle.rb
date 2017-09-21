class Vehicle < ApplicationRecord
  enum category: [:first_category, :second_category]

  validates :color, :model, :category, presence: true
  validates :licence_plate, presence: true, uniqueness: { case_sensitive: false }
  validate :permitted_licence_plate

  def permitted_licence_plate
    unless BusinessRulesConfig.permitted_licence_plates.include?(self.licence_plate[0, 3])
      errors.add(:licence_plate, I18n.t('activerecord.errors.vehicle.unpermitted_licence_plate'))
    end
  end
end
