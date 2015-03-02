class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string  :name
      t.integer :total_docks
      t.boolean :in_service, default: true

      t.timestamps
    end
  end
end