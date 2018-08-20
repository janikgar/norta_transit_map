class AddDaysToTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :days, :text
  end
end
