class CreateStopTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :stop_times do |t|
      t.time :arrival_time
      t.time :departure_time
      t.integer :stop_sequence
      t.string :stop_headsign
      t.integer :pickup_type
      t.integer :drop_off_type
      t.float :shape_dist_traveled
      t.integer :timepoint
      t.string :trip_id
      t.string :stop_id

      t.timestamps
    end
  end
end
