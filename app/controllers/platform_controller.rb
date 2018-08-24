class PlatformController < ApplicationController
  def home
    @this_user = current_user
  end

  def select_route
    @routes = Route.all
  end

  def view
    @routes = File.open("#{Rails.root.to_s}/public/routes.geojson").read
    @bounds = File.open("#{Rails.root.to_s}/public/o-9vrf-neworleansrta.geojson").read
  end
  
  def route
    puts "Route: #{params[:route]}"
    @route = Route.find_by(short_name: params[:route])
    @routes = [@route]
    @trips = Trip.where(route_id: params[:route], service_id: "2886")
    @stops = nil
    @directions = @trips.pluck(:trip_headsign).uniq
    @times = get_weekday_route_times(params[:route]
  end

  # private
  def get_weekday_route_times(route)
    trips = Trip.where(service_id: "2886", route_id: route)
    trip_list = []
    trips.each do |this_trip|
      this_headsign = this_trip.trip_headsign
      this_trip.times.each do |time|
        trip_list.push([this_headsign, time[0], time[1]])
      end
    end
    return trip_list
  end
  # END private
end
