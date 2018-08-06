class AddStopsToRoute < ActiveRecord::Migration[5.2]
  def change
    add_column :routes, :stops, :text
  end
end
