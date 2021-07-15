class AddSourceAndTargetToEdges < ActiveRecord::Migration[6.1]
  def change
    add_reference :edges, :source, null: false#, foreign_key: true
    add_reference :edges, :target, null: false#, foreign_key: true

    add_foreign_key :edges, :stations, column: :source_id
    add_foreign_key :edges, :stations, column: :target_id
  end
end
