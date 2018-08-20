class AddPointsToTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :points, :text
  end
end
