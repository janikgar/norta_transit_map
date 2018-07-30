module ApplicationHelper
    def get_routes
        routes = HTTParty.get(ENV['TL_ROUTES']+ENV['NORTA_ONESTOP'])
        parsed_routes = routes.parsed_response['routes']
        parsed_routes.each do |route|
            Route.create(route)
        end
    end
end
