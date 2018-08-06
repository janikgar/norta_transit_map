class Route < ApplicationRecord
    belongs_to :agency
    has_many :trips
    serialize :shape_array, Array
    serialize :stops, Array

    # private
        def get_stops
            trips = self.trips
            stops = []
            trips.each do |trip|
                stops.push(StopTime.where(trip_id: trip.id).pluck(:stop_id).uniq)
            end
            return stops.flatten!.uniq!
        end
        def get_shapes
            shapes = self.trips.pluck(:shape_id).uniq
            coords = []
            shapes.each do |shape|
                shape_coords = Shape.where(shape_id: shape)
                shape_coords_to_add = []
                shape_coords.each do |shape_coord|
                    shape_coords_to_add.push([shape_coord.shape_pt_lon, shape_coord.shape_pt_lat])
                end
                coords.push(shape_coords_to_add)
            end
            return coords
        end
    # END private
end
