class CreateRouteStopPatterns < ActiveRecord::Migration[5.2]
  def change
    create_table :route_stop_patterns do |t|
      t.string :onestop_id
      t.string :route_onestop_id
      t.text :geometry
      t.text :stop_pattern
      t.text :stop_distances
      t.text :identifiers
      t.text :trips
      t.text :tags
      t.string :geometry_source

      t.timestamps
    end
  end
end
