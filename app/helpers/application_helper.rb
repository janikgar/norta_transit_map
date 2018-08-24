module ApplicationHelper

    # def get_all_models
    #     get_calendars
    #     get_routes
    #     get_stops
    #     get_shapes
    #     get_trips
    #     get_stop_times
    # end
  def get_source(local=true)
    if local
      source = GTFS::Source.build('public/temp.zip')
    else
      source = GTFS::Source.build('http://www.norta.com/CMSTemplates/RTAApplication/MyRTA/OpenSourceDataDownload.aspx?key=YAEVCJMWGJKVBFAD')
    end
    return source
  end

  def load_stops
    source = get_source
    stops = source.stops.clone
    source = nil
    stops.each do |stop|
      this_stop = stop.instance_values
      this_stop.delete('feed')
      Stop.create(this_stop)
    end
    # stops.each do |stop|
    #   Stop.create(location_type: stop.location_type, parent_station: stop.parent_station, stop_code: stop.stop_code, stop_desc: stop.stop_desc, stop_id: stop.stop_id, stop_lat: stop.stop_lat, stop_lon: stop.stop_lon, stop_name: stop.stop_name, stop_timezone: stop.stop_timezone, stop_url: stop.stop_url, wheelchair_boarding: stop.wheelchair_boarding, zone_id: stop.zone_id)
    # end
  end

  def load_calendars
    source = get_source
    calendars = source.calendars.clone
    source = nil
    calendars.each do |calendar|
      this_cal = calendar.instance_values
      this_cal.delete('feed')
      Calendar.create(this_cal)
    end
  end
  
  # def load_sched
  #   source = get_source
  #   schedules = source.stop_times.clone
  #   source = nil
  #   trips = Trip.all
  #   trips.each do |trip|
  #     scheds = schedules.select{|sched| sched.trip_id == trip.trip_id}
  #     all_scheds = []
  #     scheds.each do |sched|
  #       time_elements = sched.arrival_time.split(":")
  #       if time_elements[0].to_i >= 24
  #         puts time_elements
  #         time_elements[0] = (time_elements[0].to_i - 24)
  #       end
  #       this_time = time_elements.join(":")
  #       puts this_time
  #       all_scheds.push(Time.parse(this_time))
  #     end
  #     trip.update(times: all_scheds)
  #   end
  # end
  
  def load_routes
    source = get_source
    routes = source.routes.clone
    source = nil
    routes.each do |route|
      this_route = route.instance_values
      this_route.delete('feed')
      Route.create(this_route)
    end
  end
  
  def load_shapes
    source = get_source
    shapes = source.shapes.clone
    source = nil
    shapes.each do |shape|
      this_shape = shape.instance_values
      this_shape.delete('feed')
      Shape.create(this_shape)
    end
  end

  def load_trips
    source = get_source
    trips = source.trips.clone
    source = nil
    trips.each do |trip|
      this_trip = trip.instance_values
      this_trip.delete('feed')
      Trip.create(this_trip)
    end
  end

  def load_stop_times
    source = get_source
    stop_times = source.stop_times.clone
    source = nil
    stop_times.each do |stop_time|
      this_stop_time = stop_time.instance_values
      this_stop_time.delete('feed')
      StopTime.create(this_stop_time)
    end
  end

  # def init_calendars
  #   source = get_source
  #   calendars = source.calendars.clone
  #   source = nil
  #   calendar_array = []
  #   calendars.each do |cal|
  #     day_string = ""
  #     this_cal = cal.instance_values
  #     day_string += "Su" if this_cal['sunday'] == '1'
  #     day_string += "M" if this_cal['monday'] == '1'
  #     day_string += "T" if this_cal['tuesday'] == '1'
  #     day_string += "W" if this_cal['wednesday'] == '1'
  #     day_string += "R" if this_cal['thursday'] == '1'
  #     day_string += "F" if this_cal['friday'] == '1'
  #     day_string += "Sa" if this_cal['saturday'] == '1'
  #     calendar_array.push({service_id: this_cal['service_id'], start_date: this_cal['start_date'], end_date: this_cal['end_date'], day_string: day_string})
  #   end
  #   return calendar_array
  # end

  # def add_days_to_trips
  #   calendar_array = init_calendars
  #   matching_calendar = nil
  #   trips = Trip.all
  #   trips.each do |trip|
  #     calendar_array.each do |cal|
  #       if cal[:service_id] == trip.service_id
  #         matching_calendar = cal
  #       end
  #     end
  #     trip.update(days: matching_calendar[:day_string])
  #   end
  # end

  # def add_shapes_to_trips
  #   source = get_source
  #   shapes = source.shapes.clone
  #   source = nil
  #   trips = Trip.all
  #   trips.each do |trip|
  #     shape_array = []
  #     these_shapes = shapes.select{|shape| shape.shape_id == trip.shape_id}
  #     these_shapes.each do |shape|
  #       shape_array.push([shape.shape_pt_lat, shape.shape_pt_lon])
  #     end
  #     trip.update(points: shape_array)
  #   end
  # end
  
  # def add_times_to_trips
  #   source = get_source
  #   stop_times = source.stop_times.clone
  #   source = nil
  #   trips = Trip.all
  #   trips.each do |trip|
  #     stop_time_array = []
  #     these_stop_times = stop_times.select{|stop_time| stop_time.trip_id == trip.trip_id}
  #     these_stop_times.each do |stop_time|
  #       stop_time_array.push([stop_time.stop_id, stop_time.arrival_time])
  #     end
  #     trip.update(times: stop_time_array)
  #   end
  # end

    

  # def import_routes(url = nil)
  #   if url == nil
  #     url = 'https://transit.land/api/v1/routes?operated_by=o-9vrf-neworleansrta'
  #   end
  #   request = HTTParty.get(url)
  #   response = JSON.parse(request.body)['routes']
  #   meta = JSON.parse(request.body)['meta']
  #   # request = nil # TODO: garbage collect (if needed)

  #   response.each do |route|
  #     new_route = Route.create(short_name: route['name'], long_name: route['tags']['route_long_name'], color: route['tags']['route_color'], text_color: route['tags']['route_text_color'], onestop_id: route['onestop_id'], remote_updated_at: route['updated_at'])
  #   end
  #   if !meta['next']
  #     return 0
  #   else
  #     # Since this will eventually need to be an Active Job, remember to re-structure!
  #     sleep 4
  #     import_routes(meta['next'])
  #   end
  # end

  # def import_sched(route_string, url = nil)
  #   route_onestop = Route.find_by(short_name: route_string).onestop_id
  #   if url == nil
  #     url = "https://transit.land/api/v1/schedule_stop_pairs?date=today&operator_onestop_id=o-9vrf-neworleansrta&route_onestop_id=#{route_onestop}"
  #   end
  #   request = HTTParty.get(url)
  #   response = JSON.parse(request.body)['schedule_stop_pairs']
  #   meta = JSON.parse(request.body)['meta']
  #   # request = nil # TODO: garbage collect (if needed)

  #   response.each do |sched|
  #     puts sched
  #     this_route = Route.find_by(onestop_id: sched['route_onestop_id'])
  #     new_sched = Schedule.create(route: this_route.short_name, headsign: sched['trip_headsign'], origin_stop: sched['route_onestop_id'], origin_stop_time: sched['origin_arrival_time'], remote_updated_at: sched['updated_at'])
  #   end
  #   if !meta['next']
  #     return 0
  #   else
  #     # Since this will eventually need to be an Active Job, remember to re-structure!
  #     sleep 4
  #     import_sched(route_string, meta['next'])
  #   end
  # end

  # def perform_route_sched_job(route_string)
  #   schedule_update = schedule_exist?(route_string)
  #   if schedule_update
  #     # If we have schedules in the system, compare with the transit.land version to see if there are new updates
  #     remote_test = HTTParty.get("https://transit.land/api/v1/feeds/f-9vrf-neworleansrta")
  #     last_update = remote_test['updated_at']
  #     if DateTime.parse(last_update) > schedule_update
  #       #import
  #     end
  #   else
  #     #import
  #   end
  # end

  # def schedule_exist?(route_string)
  #   if Schedule.count != 0
  #     find_schedule = Route.where(route: route_string).pluck(remote_updated_at)
  #     find_schedule.sort!
  #     return find_schedule.first
  #   else
  #     return false
  #   end
  # end

  #   def get_transitland_request(model, url, test = false)
  #       continue = true
  #       request_url = url + ENV['NORTA_ONESTOP']
  #       while continue do
  #           if test == true # Creates a smaller request for testing purposese
  #               request_url += "&per_page=1" 
  #           else
  #               request_url += "&per_page=1000&offset=451305" 
  #           end
  #           request = HTTParty.get(request_url)
  #           parsed_response = request.parsed_response
  #           parsed_response.each do |key, value|
  #               if key != 'meta' # choose the model key, not the meta key
  #                   model.create(value)
  #               elsif key == 'meta' # use the meta key to see if we have more requests to make
  #                   if !request['meta']['next'].nil?
  #                       request_url = request['meta']['next']
  #                   else
  #                       continue = false
  #                   end
  #               end
  #           end
  #           continue = false if test == 1
  #           sleep(3)
  #       end
  #   end
    
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