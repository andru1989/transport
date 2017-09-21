require 'rails_helper'

RSpec.describe BusinessRulesConfig do
  it 'creates class methods based on yml keys' do
    expect(BusinessRulesConfig.permitted_licence_plates).to eql(['ABC', 'DFG'])
  end
end
