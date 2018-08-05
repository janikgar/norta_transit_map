class AddShapeArrayToRoutes < ActiveRecord::Migration[5.2]
  def change
    add_column :routes, :shape_array, :text
  end
end
