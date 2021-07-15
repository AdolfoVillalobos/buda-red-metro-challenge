require 'rails_helper'

RSpec.describe MetroNetwork, type: :model do
 it 'has a valid factory' do
   expect(build(:metro_network)).to be_valid
 end 
end
