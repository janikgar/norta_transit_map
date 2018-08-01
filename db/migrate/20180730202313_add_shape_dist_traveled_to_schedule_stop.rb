class AddShapeDistTraveledToScheduleStop < ActiveRecord::Migration[5.2]
  def change
    add_column :schedule_stops, :shape_dist_traveled, :float
  end
end
