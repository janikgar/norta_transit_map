class AddTimesToTrip < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :times, :text
  end
end
