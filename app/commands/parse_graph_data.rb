class ParseGraphData < PowerTypes::Command.new(:data)
  def perform
    @graph = @data["metroStations"].map(&:symbolize_keys)
    @graph.inject({}) do |graph, station|
      graph[station[:name]] = station
      graph
    end
  end
end
