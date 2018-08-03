class AddShapeIdToTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :shape_id, :string
  end
end
