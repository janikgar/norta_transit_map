class TripController < ApplicationController
  def create
    these_params = trip_params
    these_params[:direction_id] = these_params[:direction_id].to_i
    these_params[:wheelchair_accessible] = these_params[:wheelchair_accessible].to_i
    these_params[:bikes_allowed] = these_params[:bikes_allowed].to_i

    @trip = Trip.create(these_params)
  end

  protected
  def trip_params
    params.require(:trips).permit(:trip_id, :trip_headsign, :trip_short_name, :direction_id, :block_id, :wheelchair_accessible, :bikes_allowed)
  end
end
