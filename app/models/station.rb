class Station < ApplicationRecord
  belongs_to :metro_network
  has_many :sink_edges, :class_name => 'Edge', :foreign_key => 'source_id'

  enum color: { no_color: 0, green: 1, red: 2}
  enum status: { no_visited: 0, visited: 1, done: 2}

  validates :name, presence: true
  validates :color, presence: true,
                inclusion: { in: Station.colors.keys }
  validates :status, presence: true,
                inclusion: { in: Station.statuses.keys }

  def reset
    update(status: 0, distance_from_source: 2**32)
  end

  def reset_source
    update(distance_from_source: 0)
  end

  def visit(new_distance)
    update(status: 1, distance_from_source: new_distance)
  end
end
