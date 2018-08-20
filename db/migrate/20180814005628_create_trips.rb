class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :bikes_allowd
      t.string :direction_id
      t.string :route_id
      t.string :service_id
      t.string :shape_id
      t.string :trip_headsign
      t.string :trip_id
      t.string :wheelchair_accessible

      t.timestamps
    end
  end
end
