class CreateStops < ActiveRecord::Migration[5.2]
  def change
    create_table :stops do |t|
      t.string :stop_id
      t.string :stop_code
      t.string :stop_name
      t.string :stop_desc
      t.float :stop_lat # convert to float
      t.float :stop_lon  # convert to float
      t.string :zone_id
      t.string :stop_url
      t.integer :location_type # convert to int
      t.string :parent_station
      t.string :stop_timezone
      t.integer :wheelchair_boarding # convert to int
      t.timestamps
    end
    add_index :stops, :stop_id, unique: true
  end
end
