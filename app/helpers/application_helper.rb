module ApplicationHelper

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
