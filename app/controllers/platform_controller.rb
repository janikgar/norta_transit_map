class PlatformController < ApplicationController
  def view
    @routes = Route.all
    # @sorted_routes = 
    @sorted_routes = Route.select(:id, :route_short_name).order(:route_short_name)
  end

  def route
    # if !params[:route]
    #   flash[:notice] = 'Select a route'
    #   redirect_to root_path
    # end
    @route = Route.find(params[:route])
    @trips = Trip.where(route_id: params[:route]).order(:calendar_id)
    @all_stop_times = []
    @all_stops = []
    @trips.each do |trip|
      @stop_times = StopTime.where(trip_id: trip.id)
      @stop_times.each do |stop_time|
        @stops = Stop.where(id: stop_time.stop_id)
        @all_stop_times.push(stop_time)
        @stops.each do |stop|
          @all_stops.push(stop)
        end
      end
    end
    # @schedules = []
    # @calendars = Calendar.all
    # @calendars.each do |calendar|
    #   @trips.each do |trip|
    #     @schedules.push(StopTime.where(trip_id: trip[:id]));
    #   end
    # end
  end

  private
    def sort_routes_by_name(routes)
      sortable_records = []
      routes.select(:route_short_name, :id).each do |route|
      # routes.select(:name, :id).each do |route|
        # name = route[:name].gsub(/\D/, '').to_i # Remove non-digit characters and convert route name to integer so we can sort
        name = route[:name].to_i # Remove non-digit characters and convert route name to integer so we can sort
        sortable_records.push(name: name, id: :id)
      end
      # sortable_records.sort_by{|item| item.name}
      # return_records = []
      # sortable_records.each do |item|
      #   return_records.push(Route.find(item.id))
      # end
      return sortable_records.sort_by{ |record| record[:name] }
    end
  # END private
end
