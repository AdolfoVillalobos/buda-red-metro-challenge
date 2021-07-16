class Edge < ApplicationRecord
  belongs_to :source, :class_name => 'Station', :foreign_key => 'source_id'
  belongs_to :target, :class_name => 'Station', :foreign_key => 'target_id'

  def new_cost(train_color)
    return 1 if train_color == 0

    return 1 if source.no_color?
    return 1 if source.color == target.color
    return 1 if target.no_color?
    return 0
  end
end
