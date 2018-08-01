module ApplicationHelper
    def get_routes
        get_transitland_request(Route, ENV['TL_ROUTES'])
        # routes = HTTParty.get(ENV['TL_ROUTES']+ENV['NORTA_ONESTOP'])
        # parsed_routes = routes.parsed_response['routes']
        # parsed_routes.each do |route|
        #     Route.create(route)
        # end
    end

    def get_stop_times
        # This is the original GTFS feed model, as opposed to Transitland's version above. We can only take this from the GTFS .zip, not Transitland's API.
        get_zip_file_request(StopTime, 'app/assets/temp.zip', true)
    end
    
    def get_stops
        get_zip_file_request(Stop)
    end

    def get_trips
        get_zip_file_request(Trip)
    end

    def get_calendars
        get_zip_file_request(Calendar)
    end

    def get_zip_file_request(model, file_path = 'app/assets/temp.zip', test = false)
        continue = true
        model_string = model.name.underscore.pluralize # Convert the model's CamelCase name to plural & snake_case to query GTFS
        # Below, we use public_send to call the method given its name
        puts "FilePath: #{file_path}"
        puts "ModelString: #{model_string}"
        source = GTFS::Source.build(file_path)
        request = source.public_send(model_string)
        while continue do
            request.each do |response|
                parsed_response = response.instance_values
                parsed_response.delete('feed') # The GTFS library includes a reference to the feed object; we don't need this
                model.create(parsed_response)
                continue = false if test == true
            end
            continue = false
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
end
