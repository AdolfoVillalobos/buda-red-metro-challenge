class CreateMetroNetworks < ActiveRecord::Migration[6.1]
  def change
    create_table :metro_networks do |t|
      t.string :name

      t.timestamps
    end
  end
end
