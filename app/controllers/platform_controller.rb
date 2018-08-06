class PlatformController < ApplicationController
  def view
    @routes = File.open("#{Rails.root.to_s}/public/routes.geojson").read
    @bounds = File.open("#{Rails.root.to_s}/public/o-9vrf-neworleansrta.geojson").read
  end
  
  def route
    @routes_geojson = File.open("#{Rails.root.to_s}/public/routes.geojson").read
    @bounds_geojson = File.open("#{Rails.root.to_s}/public/o-9vrf-neworleansrta.geojson").read
    @routes = JSON.parse(@routes_geojson)['features']
    @routes.each do |route|
      if route['properties']['name'] == params[:route].to_s
        @routes = JSON.generate(route)
        @bounds = JSON.generate(route)
      end
    end
  end

  private
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
