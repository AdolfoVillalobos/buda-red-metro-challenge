class CreateStations < ActiveRecord::Migration[6.1]
  def change
    create_table :stations do |t|
      t.string :name
      t.integer :color
      t.integer :status
      t.integer :distance_from_source
      t.references :metro_network, null: false, foreign_key: true

      t.timestamps
    end
  end
end
