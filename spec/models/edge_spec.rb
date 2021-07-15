require 'rails_helper'

RSpec.describe Edge, type: :model do
  it 'has a valid factory' do
    expect(build(:edge)).to be_valid
  end

  describe 'associations' do
    it {is_expected.to belong_to(:source)}
    it {is_expected.to belong_to(:target)}
  end
end
