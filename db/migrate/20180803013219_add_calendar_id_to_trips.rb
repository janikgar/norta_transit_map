class AddCalendarIdToTrips < ActiveRecord::Migration[5.2]
  def change
    add_reference :trips, :calendar, foreign_key: true
  end
end
