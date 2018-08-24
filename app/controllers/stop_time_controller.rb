class StopTimeController < ApplicationController
  def create
    these_params = stop_time_params
    these_params[:arrival_time] = Time.parse(these_params[:arrival_time])
    these_params[:departure_time] = Time.parse(these_params[:departure_time])
    these_params[:stop_sequence] = these_params[:stop_sequence].to_i
    these_params[:pickup_type] = these_params[:pickup_type].to_i
    these_params[:drop_off_type] = these_params[:drop_off_type].to_i
    these_params[:shape_dist_traveled] = these_params[:shape_dist_traveled].to_f
    these_params[:timepoint] = these_params[:timepoint].to_i

    @stop_time = StopTime.create(these_params)
  end

  def trip
    Trip.find_by(trip_id: self.trip_id)
  end

  def stop
    Stop.find_by(stop_id: self.stop_id)
  end

  protected
  def stop_time_params
    params.require(:stop_times).permit(:arrival_time, :departure_time, :stop_sequence, :stop_headsign, :pickup_type, :drop_off_type, :shape_dist_traveled, :timepoint, :trip_id, :stop_id)
  end
end
