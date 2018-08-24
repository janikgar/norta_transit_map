class StopController < ApplicationController
  def create
    these_params = stop_params
    these_params[:stop_lat] = these_params[:stop_lat].to_f
    these_params[:stop_lon] = these_params[:stop_lon].to_f
    these_params[:location_type] = these_params[:location_type].to_i
    these_params[:wheelchair_boarding] = these_params[:wheelchair_boarding].to_i

    @stop = Stop.create(these_params)
  end

  protected
  def stop_params
    params.require(:stops).permit(:stop_id, :stop_code, :stop_name, :stop_desc, :stop_lat, :stop_lon, :zone_id, :stop_url, :location_type, :parent_station, :stop_timezone, :wheelchair_boarding)
  end
end