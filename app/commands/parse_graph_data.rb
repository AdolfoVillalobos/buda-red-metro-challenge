class ParseGraphData < PowerTypes::Command.new(:data)
  def perform
    @graph = @data["metroStations"].map(&:symbolize_keys)
    @graph.each do |hash|
      if hash[:color].blank?
        hash[:color] = 0
      end
    end
    @graph.inject({}) do |graph, station|
      graph[station[:name]] = station
      graph
    end
  end
end
