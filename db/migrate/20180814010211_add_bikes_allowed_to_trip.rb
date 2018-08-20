class AddBikesAllowedToTrip < ActiveRecord::Migration[5.2]
  def up
    add_column :trips, :bikes_allowed, :string
    remove_column :trips, :bikes_allowd
  end
  def down
    remove_column :trips, :bikes_allowed
    add_column :trips, :bikes_allowd, :string
  end
end
