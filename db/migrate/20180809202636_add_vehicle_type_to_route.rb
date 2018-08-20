class AddVehicleTypeToRoute < ActiveRecord::Migration[5.2]
  def change
    add_column :routes, :vehicle_type, :string
  end
end
