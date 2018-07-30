module ApplicationHelper
    def get_routes
        routes = HTTParty.get(ENV['tl_routes']+ENV['norta_onestop'])
        parsed_routes = routes.parsed_response['routes']
        parsed_routes.each do |route|
            Route.create(route)
        end
    end
end
