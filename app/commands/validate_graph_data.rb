class ValidateGraphData < PowerTypes::Command.new(:data)

  JSON_SCHEMA = "#{Rails.root}/app/commands/schemas/metro_stations.json"
  def perform
    JSON::Validator.validate(JSON_SCHEMA, @data)
  end
end
