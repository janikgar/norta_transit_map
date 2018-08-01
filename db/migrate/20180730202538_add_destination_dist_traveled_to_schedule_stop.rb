class AddDestinationDistTraveledToScheduleStop < ActiveRecord::Migration[5.2]
  def change
    add_column :schedule_stops, :destination_dist_traveled, :float
    remove_column :schedule_stops, :destination_dist_traveled_float
  end
end
