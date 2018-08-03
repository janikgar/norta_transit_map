class CreateStops < ActiveRecord::Migration[5.2]
  def change
    create_table :stops do |t|
      t.string :stop_code
      t.string :stop_name
      t.text :stop_desc
      t.float :stop_lat
      t.float :stop_lon
      t.string :zone_id
      t.string :stop_url
      t.integer :location_type
      t.integer :parent_station
      t.string :stop_timezone
      t.integer :wheelchair_boarding

      t.timestamps
    end
  end
end
