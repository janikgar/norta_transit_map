class AddShapeIdToShapes < ActiveRecord::Migration[5.2]
  def change
    add_column :shapes, :shape_id, :string
  end
end
