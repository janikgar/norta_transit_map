class AddShapeDistTraveledToShapes < ActiveRecord::Migration[5.2]
  def change
    remove_column :shapes, :shape_dist_travled
    add_column :shapes, :shape_dist_traveled, :float
  end
end
