class Station < ApplicationRecord
  belongs_to :metro_network

  enum color: { no_color: 0, green: 1, red: 2}
  enum status: { no_visited: 0, visited: 1, done: 2}

  validates :name, presence: true
  validates :color, presence: true,
                inclusion: { in: Station.colors.keys }
  validates :status, presence: true,
                inclusion: { in: Station.statuses.keys }
end
