class CreateStopTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :stop_times do |t|
      t.string :trip_id
      t.string :stop_id
      t.time :arrival_time # convert
      t.time :departure_time # convert
      t.integer :stop_sequence # convert
      t.string :stop_headsign
      t.integer :pickup_type # convert
      t.integer :drop_off_type # convert
      t.float :shape_dist_traveled # convert
      t.integer :timepoint # convert
      t.timestamps
    end
    add_foreign_key :stop_times, :trips, column: :trip_id, primary_key: :trip_id
    add_foreign_key :stop_times, :stops, column: :stop_id, primary_key: :stop_id
  end
end
