require 'rails_helper'

RSpec.describe Travel, type: :model do
  it 'has a valid factory' do
    expect(build(:travel)).to be_valid
  end

  describe 'ActiveModel validations' do
    it { should validate_presence_of(:origin) }
    it { should validate_presence_of(:destination) }
  end

  describe "ActiveRecord associations" do
    it { should belong_to(:vehicle) }
    it { should belong_to(:passenger) }
  end
end
