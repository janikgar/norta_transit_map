class PlatformController < ApplicationController
  def view
    @routes = File.open("#{Rails.root.to_s}/public/routes.geojson").read
    @bounds = File.open("#{Rails.root.to_s}/public/o-9vrf-neworleansrta.geojson").read
  end
  
  def route
    @routes = JSON.parse(File.open("#{Rails.root.to_s}/public/routes.geojson").read)['features']
    @bounds_geojson = JSON.parse(File.open("#{Rails.root.to_s}/public/o-9vrf-neworleansrta.geojson").read)['features']
    @stops = JSON.parse(File.open("#{Rails.root.to_s}/public/stops.geojson").read)
    @routes.each do |route|
      if route['properties']['name'] == params[:route].to_s
        @onestop = route['properties']['onestop_id']
        @routes = JSON.generate(route)
        @bounds = JSON.generate(route)
      end
    end
    @display_stops = @stops.clone
    @display_stops.delete('features')
    @display_stops['features'] = []
    @stops['features'].each do |stop|
      stop['properties']['routes_serving_stop'].each do |route_serving_stop|
        if route_serving_stop['route_name'] == params[:route].to_s
          @display_stops['features'].push(stop)
        end
      end
    end
    @display_stops = JSON.generate(@display_stops)
    @schedule_import = HTTParty.get("https://transit.land/api/v1/schedule_stop_pairs?date=today&operator_onestop_id=o-9vrf-neworleansrta&route_onestop_id=#{@onestop}&per_page=500")

    @directions = []
    @directions_hash = {}

    @schedule_import['schedule_stop_pairs'].each do |sched|
      # @directions_hash[k] = v
      @directions.push([sched['trip_headsign'], get_stop_name_by_id(sched['origin_onestop_id']), sched['origin_arrival_time']])
    end

    @directions.group_by{|k, v1, v2| k}.each do |k1, v1|
      # puts "Key: #{k}"
      # if !@directions_hash.has_key?(k1)
        @directions_hash[k1] = {}
      # end
      v1.group_by{|k, v1, v2| v1}.each do |k2, v2|
        # if !@directions_hash[k1].has_key?(k2)
        @directions_hash[k1].merge!({k2 => []})
        v2.each do |v3|
          @directions_hash[k1][k2].push(v3[2])
        end
        # end
        # puts "Value: #{k}"
        # v2.group_by{|k2, v2| v2}.each do |k3, v3|
        #   v3.each do |v4|
        #     # if !@directions_hash[k1].include?(k2)
        #       @directions_hash[k1][k2].merge!(v4[2])
        # end
        # puts v[2]
        #   end
        # end
      end
    end

    @directions = @directions_hash
  end

  private
    def get_stop_name_by_id(id)
      @stops = JSON.parse(File.open("#{Rails.root.to_s}/public/stops.geojson").read)['features']
      @stops.each do |stop|
        # binding.pry
        if stop['properties']['onestop_id'] == id
          return stop['properties']['name']
        end
      end
    end
    def get_bounds_geojson
      request_url = ENV['TL_GEOJSON_BOUNDS']
      request = HTTParty.get(request_url)
      bounds_geo_json = JSON.parse(request.parsed_response).to_json
    end
    def get_transitland_routes_geojson
      request_url = ENV['TL_GEOJSON_ROUTES'] + ENV['NORTA_ONESTOP'] + "&per_page=false"
      request = HTTParty.get(request_url)
      routes_geo_json = JSON.parse(request.parsed_response).to_json
    end

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
