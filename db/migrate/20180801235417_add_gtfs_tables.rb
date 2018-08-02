class AddGtfsTables < ActiveRecord::Migration[5.2]
  def change
    create_table :agencies, primary_key: :agency_id do |t|
      t.string :agency_name
      t.string :agency_url
      t.string :agency_timezone
      t.string :agency_lang
      t.string :agency_phone
      t.string :agency_fare_url
      t.string :agency_email
      t.timestamps
    end
    change_column :agencies, :agency_id, :string
    
    create_table :calendars, primary_key: :service_id do |t|
      t.boolean :sunday
      t.boolean :monday
      t.boolean :tuesday
      t.boolean :wednesday
      t.boolean :thursday
      t.boolean :friday
      t.boolean :saturday
      t.date :start_date
      t.date :end_date
      t.timestamps
    end
    change_column :calendars, :service_id, :string

    create_table :stops, primary_key: :stop_id do |t|
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
    change_column :stops, :stop_id, :string

    create_table :routes, primary_key: :route_id do |t|
      t.string :route_short_name
      t.string :route_long_name
      t.text :route_desc
      t.integer :route_type
      t.string :route_url
      t.string :route_color
      t.string :route_text_color
      t.integer :route_sort_order
      t.string :agency_id
      t.timestamps
      t.belongs_to :agency, index: true
    end
    change_column :routes, :route_id, :string
    
    create_table :stop_times, primary_key: :id do |t|
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
      t.belongs_to :trip, index: true
      t.belongs_to :stop, index: true
    end
    change_column :stop_times, :id, :string
    
    
    create_table :trips, primary_key: :trip_id do |t|
      t.string :trip_headsign
      t.string :trip_short_name
      t.integer :direction_id
      t.string :block_id
      t.integer :wheelchair_accessible
      t.integer :bikes_allowed
      t.string :shape_id
      t.string :route_id
      t.string :service_id
      t.belongs_to :shape_trips, index: true
      t.belongs_to :calendar, index: true
      t.timestamps
    end
    change_column :trips, :trip_id, :string
    
    create_table :shapes, primary_key: :id do |t|
      t.integer :shape_id
      t.float :shape_pt_lat
      t.float :shape_pt_lon
      t.integer :shape_pt_sequence
      t.float :shape_dist_traveled
      t.timestamps
      t.belongs_to :shape_trips, index: true
    end

    create_table :shape_trips do |t|
      t.integer :shape_shape_id
      t.string :trip_trip_id
      t.timestamps
    end
  end
end
