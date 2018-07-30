class Route < ApplicationRecord
    serialize :geometry
    serialize :stops_served_by_route
    serialize :route_stop_patterns_by_onestop_id
    serialize :tags
end
