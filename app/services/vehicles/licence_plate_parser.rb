class Vehicles::LicencePlateParser
  include Callable

  attr_accessor :vehicle

  def initialize(vehicle)
    self.vehicle = vehicle
  end

  def call
    self.vehicle.tap do |vehicle|
      vehicle.category = set_category
    end
  end

  def set_category
    case self.vehicle.licence_plate[0, 3]
      when 'ABC' then :first_category
      when 'DFG' then :second_category
    end
  end
end
