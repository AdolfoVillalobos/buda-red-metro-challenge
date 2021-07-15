require 'rails_helper'

RSpec.describe Station, type: :model do
  it 'has a valid factory' do
    expect(build(:station)).to be_valid
  end

  describe 'associations' do
    it {is_expected.to belong_to(:metro_network)}
  end
end
