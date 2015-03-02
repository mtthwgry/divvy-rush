class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.belongs_to :station
      t.integer :bikes
      t.integer :docks

      t.timestamps
    end
  end
end
