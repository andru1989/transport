require 'rails_helper'

RSpec.describe Vehicles::LicencePlateParser, type: :service do

  describe '#call' do
    it 'returns a vehicle with first_category' do
      vehicle = build(:vehicle, licence_plate: 'ABC123')
      Vehicles::LicencePlateParser.call(vehicle)

      expect(vehicle.category).to eq('first_category')
    end

    it 'returns a vehicle with second_category' do
      vehicle = build(:vehicle, licence_plate: 'DFG123')
      Vehicles::LicencePlateParser.call(vehicle)

      expect(vehicle.category).to eq('second_category')
    end
  end
end
