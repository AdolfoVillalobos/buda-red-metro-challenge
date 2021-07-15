require 'rails_helper'

describe ParseGraphData do
  def perform
    described_class.for(data: data)
  end

  let(:valid_hash) do
    {
      "metroStations" => [
        {
          "name": "Los heroes",
          "neighbors": ["Toesca", "Cal y Canto"],
          "color": 2
        }
      ]
    }
  end

  let(:output_hash) do
      {
       'Los heroes' =>  {
          name: "Los heroes",
          neighbors: ["Toesca", "Cal y Canto"],
          color: 2
        }
      }
  end

  describe 'valid data' do
    let(:data) { valid_hash}
    it 'returns parsed hash' do
      expect(perform).to eq(output_hash)
    end
  end
end
