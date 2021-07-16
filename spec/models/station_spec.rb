require 'rails_helper'

RSpec.describe Station, type: :model do
  it 'has a valid factory' do
    expect(build(:station)).to be_valid
  end

  describe 'associations' do
    it {is_expected.to belong_to(:metro_network)}
    it {is_expected.to have_many(:sink_edges)}
  end

  describe 'validations' do
    it {is_expected.to validate_presence_of(:name) }
    it {is_expected.to validate_presence_of(:status) }
    it {is_expected.to validate_presence_of(:color) }
  end

  describe '#reset_source' do
    let(:station) { create(:station, distance_from_source: 10) }
    it 'updates distance from src station to 0' do
      station.reset_source
      expect(station).to have_attributes(distance_from_source: 0)
    end
  end

  describe '#reset' do
    let(:station) { create(:station, status:2,  distance_from_source: 10) }
    it 'updates distance from src and status' do
      station.reset
      expect(station).to have_attributes(distance_from_source: 2**32, status: "no_visited")
    end
  end

  describe '#visit' do
    let(:station) { create(:station, distance_from_source: 10) }
    let(:new_distance_from_source) { 3 }
    it 'visits station' do
      station.visit new_distance_from_source
      expect(station).to have_attributes(distance_from_source: new_distance_from_source,
                                         status: "visited")
    end
  end
end
