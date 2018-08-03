class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :trip_headsign
      t.string :trip_short_name
      t.integer :direction_id
      t.string :block_id
      t.integer :wheelchair_accessible
      t.integer :bikes_allowed

      t.timestamps
    end
  end
end
