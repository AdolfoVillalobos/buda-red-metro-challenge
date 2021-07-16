class MetroNetwork < ApplicationRecord
  has_many :stations
  has_many :edges, :through => :stations, :source => :sink_edges

  validates :name, presence: true

  def reset_stations
    @graph.stations.each do |station|
      station.reset
    end
  end

  def reset_edges(train_color)
    @graph.edges.each do |edge|
      edge.reset_cost train_color
    end
  end

  def build_graph(data)
    data.each do |name, station|
      Station.create!(name: name, color: station[:color], status: 0, metro_network_id: id)
    end

    stations.each do |station|
      data[station[:name]][:neighbors].each do |neighbor_name|
        neighbor = Station.find_by(name: neighbor_name, metro_network_id: id)
        Edge.create(cost: 1, source_id: station[:id],
                    target_id: neighbor[:id])
      end
    end
  end
end
