FactoryBot.define do
  factory :station do
    name { "Vespucio norte" }
    color { 1 }
    status { 1 }
    distance_from_source { 0 }
    metro_network
  end
end
