require 'rails_helper'

describe ValidateGraphData do
  def perform
    described_class.for(data: data)
  end

  let(:station_json_valid) do
    {
      name: "Los heroes",
      neighbors: ["Toesca", "Cal y Canto"],
      color: 1
    }
  end

  describe 'valid data' do
    let(:data) { { metroStations: [ station_json_valid ]} }
    it 'returns true' do
      expect(perform).to eq(true)
    end
  end
end
