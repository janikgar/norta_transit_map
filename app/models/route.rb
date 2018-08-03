class Route < ApplicationRecord
    belongs_to :agency
    has_many :trips

    # private
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
