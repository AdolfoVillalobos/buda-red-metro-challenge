class Edge < ApplicationRecord
  belongs_to :source, :class_name => 'Station', :foreign_key => 'source_id'
  belongs_to :target, :class_name => 'Station', :foreign_key => 'target_id'
end
