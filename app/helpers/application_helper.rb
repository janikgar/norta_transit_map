module ApplicationHelper

  def import_routes(url = nil)
    if url == nil
      url = 'https://transit.land/api/v1/routes?operated_by=o-9vrf-neworleansrta'
    end
    request = HTTParty.get(url)
    response = JSON.parse(request.body)['routes']
    meta = JSON.parse(request.body)['meta']
    # request = nil # TODO: garbage collect (if needed)

    response.each do |route|
      new_route = Route.create(short_name: route['name'], long_name: route['tags']['route_long_name'], color: route['tags']['route_color'], text_color: route['tags']['route_text_color'], onestop_id: route['onestop_id'], remote_updated_at: route['updated_at'])
    end
    if !meta['next']
      return 0
    else
      # Since this will eventually need to be an Active Job, remember to re-structure!
      sleep 4
      import_routes(meta['next'])
    end
  end

  def import_sched(route_string, url = nil)
    route_onestop = Route.find_by(short_name: route_string).onestop_id
    if url == nil
      url = "https://transit.land/api/v1/schedule_stop_pairs?date=today&operator_onestop_id=o-9vrf-neworleansrta&route_onestop_id=#{route_onestop}"
    end
    request = HTTParty.get(url)
    response = JSON.parse(request.body)['schedule_stop_pairs']
    meta = JSON.parse(request.body)['meta']
    # request = nil # TODO: garbage collect (if needed)

    response.each do |sched|
      puts sched
      this_route = Route.find_by(onestop_id: sched['route_onestop_id'])
      new_sched = Schedule.create(route: this_route.short_name, headsign: sched['trip_headsign'], origin_stop: sched['route_onestop_id'], origin_stop_time: sched['origin_arrival_time'], remote_updated_at: sched['updated_at'])
    end
    if !meta['next']
      return 0
    else
      # Since this will eventually need to be an Active Job, remember to re-structure!
      sleep 4
      import_sched(route_string, meta['next'])
    end
  end

  def perform_route_sched_job(route_string)
    schedule_update = schedule_exist?(route_string)
    if schedule_update
      # If we have schedules in the system, compare with the transit.land version to see if there are new updates
      remote_test = HTTParty.get("https://transit.land/api/v1/feeds/f-9vrf-neworleansrta")
      last_update = remote_test['updated_at']
      if DateTime.parse(last_update) > schedule_update
        #import
      end
    else
      #import
    end
  end

  def schedule_exist?(route_string)
    if Schedule.count != 0
      find_schedule = Route.where(route: route_string).pluck(remote_updated_at)
      find_schedule.sort!
      return find_schedule.first
    else
      return false
    end
  end

    def get_transitland_request(model, url, test = false)
        continue = true
        request_url = url + ENV['NORTA_ONESTOP']
        while continue do
            if test == true # Creates a smaller request for testing purposese
                request_url += "&per_page=1" 
            else
                request_url += "&per_page=1000&offset=451305" 
            end
            request = HTTParty.get(request_url)
            parsed_response = request.parsed_response
            parsed_response.each do |key, value|
                if key != 'meta' # choose the model key, not the meta key
                    model.create(value)
                elsif key == 'meta' # use the meta key to see if we have more requests to make
                    if !request['meta']['next'].nil?
                        request_url = request['meta']['next']
                    else
                        continue = false
                    end
                end
            end
            continue = false if test == 1
            sleep(3)
        end
    end
    
    # def get_all_models
    #     get_agencies
    #     get_calendars
    #     get_routes
    #     get_stops
    #     get_shapes
    #     get_trips
    #     get_stop_times
    # end
    
    # def get_routes
    #     get_transitland_request(Route, ENV['TL_ROUTES'])
    #     # routes = HTTParty.get(ENV['TL_ROUTES']+ENV['NORTA_ONESTOP'])
    #     # parsed_routes = routes.parsed_response['routes']
    #     # parsed_routes.each do |route|
    #     #     Route.create(route)
    #     # end
    # end
    
    ## This function no longer works once Shape has been dropped from the model.
    
    # def add_shapes_to_routes
    #     Route.all.each do |route|
    #         if route.shape_array
    #             route.shape_array = []
    #         end
    #         route_array = []
    #         shape_ids = route.trips.pluck(:shape_id).uniq
    #         shape_ids.each do |shape|
    #             these_shapes = Shape.where(shape_id: shape)
    #             shape_array = []
    #             these_shapes.each do |this_shape|
    #                 shape_array.push([this_shape.shape_pt_lat, this_shape.shape_pt_lon])
    #             end
    #             route_array.push(shape_array)
    #         end
    #         route.update(shape_array: route_array)
    #     end
    # end
    
    # def add_stops_to_routes
    #     Route.all.each do |route|
    #         trips = route.trips
    #         stops = []
    #         trips.each do |trip|
    #             stops.push(StopTime.where(trip_id: trip.id).pluck(:stop_id).uniq)
    #         end
    #         stops.flatten!.uniq!
    #         route.update(stops: stops)
    #     end
    # end

    #     def get_stop_times
    #         # This is the original GTFS feed model, as opposed to Transitland's version above. We can only take this from the GTFS .zip, not Transitland's API.
    #         get_transitland_request(StopTime)
    #     end
        
    #     def get_stops
    #         get_transitland_request(Stop)
    #     end
        
    #     def get_trips
    #         get_transitland_request(Trip)
    #     end
        
    #     def get_calendars
    #         get_transitland_request(Calendar)
    #     end
        
    #     def get_routes
    #         get_transitland_request(Route)
    #     end
        
    #     def get_shapes
    #         get_transitland_request(Shape)
    #     end
        
    #     def get_agencies
    #         get_transitland_request(Agency)
    #     end
    # end
end
