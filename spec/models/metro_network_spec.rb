require 'rails_helper'

RSpec.describe MetroNetwork, type: :model do
 it 'has a valid factory' do
   expect(build(:metro_network)).to be_valid
  end

  describe 'associations' do
    it { is_expected.to have_many(:stations) }
    it { is_expected.to have_many(:edges) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe "#build_graph" do
    let(:filename) { 'simple_metro_data' }
    def json_data
      file_content = file_fixture("#{filename}.json").read
      hash = JSON.parse(file_content)
      ParseGraphData.for(data: hash)
    end

    let(:metro) { create(:metro_network, name: "Metro de Santiago")}
    before do
      json_data
      metro.build_graph(json_data)
    end

    context 'with valid data' do
      it 'builds graph stations' do
        stations = Station.where(metro_network_id: metro[:id])
        expect(metro.stations).to eq(stations)
      end
      it 'builds graph edges' do
        edges = Station.where(metro_network_id: metro[:id]).map(&:sink_edges).flatten
        expect(metro.edges).to eq(edges)
      end
    end
  end
end
