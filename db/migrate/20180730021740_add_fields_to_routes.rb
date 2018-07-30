class AddFieldsToRoutes < ActiveRecord::Migration[5.2]
  def change
    add_column :routes, :created_or_updated_in_changeset_id, :integer
    add_column :routes, :stops_served_by_route, :text
    add_column :routes, :operated_by_onestop_id, :string
    add_column :routes, :operated_by_name, :string
    add_column :routes, :route_stop_patterns_by_onestop_id, :text
  end
end
