class Trip < ApplicationRecord
  serialize :points, Array
  serialize :times, Array

  # belongs_to :calendar
  # belongs_to :route
  # has_many :stop_times

  def stop_times
    @trip_id = self.trip_id
    @stop_times = StopTime.where(trip_id: @trip_id)
  end

end
