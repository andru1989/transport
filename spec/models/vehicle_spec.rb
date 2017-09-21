require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  it 'has a valid factory' do
    expect(build(:vehicle)).to be_valid
  end

  describe 'ActiveModel validations' do
    subject { build(:vehicle) }

    it { should validate_uniqueness_of(:licence_plate).case_insensitive }
    #it { should validate_presence_of(:licence_plate) }
    it { should validate_presence_of(:color) }
    it { should validate_presence_of(:model) }
    it { should validate_presence_of(:category) }
  end

  describe 'ActiveRecord enums' do
    it { should define_enum_for(:category).with([:first_category, :second_category]) }
  end

  describe 'when has an unpermitted_licence_plate' do
    let(:vehicle) { build(:vehicle, licence_plate: 'DEF123') }

    it 'returns an invalid vehicle object' do
      expect(vehicle.valid?).to be_falsey
    end

    it 'has an error message' do
      vehicle.valid?
      expect(vehicle.errors.full_messages).to include(/Placa no permitida por el sistema/)
    end
  end
end
