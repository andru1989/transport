require 'rails_helper'

RSpec.describe Passenger, type: :model do
  it 'has a valid factory' do
    expect(build(:passenger)).to be_valid
  end

  describe 'ActiveModel validations' do
    it { should validate_presence_of(:name) }
  end
end
