require 'rails_helper'

describe ParseGraphData do
  def perform
    described_class.for(data: data)
  end

  let(:station1) do
    {
      "name": "Los heroes",
      "neighbors": ["Toesca", "Cal y Canto"],
      "color": 2
    }
  end

  let(:station2) do
    {
      "name": "Toesca",
      "neighbors": ["Los heroes", "Rondizzoni"],
      "color": 1
    }
  end

  let(:data) { {"metroStations" => [ station1, station2]} }


  describe 'valid data' do
    it 'parsed hash contain station names as keys' do
      expect(perform).to have_key("Toesca")
      expect(perform).to have_key("Los heroes")
    end

    it 'parsed stations contain symbolized names' do
      expect(perform).to include(
        "Los heroes" => hash_including(name: "Los heroes"),
        "Toesca" => hash_including(name: "Toesca")
      )
    end

    it 'parsed stations contain symbolized colors' do
      expect(perform).to include(
        "Los heroes" => hash_including(color: 2),
        "Toesca" => hash_including(color: 1)
      )
    end

    it 'parsed stations contain symbolized neighbor' do
      expect(perform).to include(
        "Los heroes" => hash_including(neighbors:  station1[:neighbors]),
        "Toesca" => hash_including(neighbors: station2[:neighbors])
      )
    end
  end
end
