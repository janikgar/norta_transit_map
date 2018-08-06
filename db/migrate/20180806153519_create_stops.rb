class CreateStops < ActiveRecord::Migration[5.2]
  def change
    create_table :stops do |t|
      t.string :onestop_id
      t.text :geometry
      t.string :name
      t.string :timezone
      t.integer :osm_way_id
      t.datetime :last_conflated_at
      t.text :served_by_vehicle_types
      t.boolean :wheelchair_boarding
      t.text :geometry_reversegeo
      t.text :geometry_centroid
      t.text :operators_serving_stop
      t.text :routes_serving_stop
      t.text :tags

      t.timestamps
    end
  end
end
