FactoryBot.define do
  factory :edge do
    cost { 1 }
    source factory: :station
    target factory: :station
  end
end
