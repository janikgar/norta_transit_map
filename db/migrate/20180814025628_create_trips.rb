class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :route_id
      t.string :service_id
      t.string :shape_id
      t.string :trip_id
      t.string :trip_headsign
      t.string :trip_short_name
      t.integer :direction_id # convert to integer
      t.string :block_id
      t.integer :wheelchair_accessible # convert to integer
      t.integer :bikes_allowed # convert to integer
      t.timestamps
    end
    add_index :trips, :trip_id, unique: true

    # add_foreign_key :trips, :routes, column: :route_id, primary_key: :route_id
    # add_foreign_key :trips, :calendars, column: :service_id, primary_key: :service_id
    # add_foreign_key :trips, :aggr_shapes, column: :shape_id, primary_key: :aggr_shape_id
  end
end
