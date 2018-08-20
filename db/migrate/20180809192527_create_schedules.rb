class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.string :route
      t.string :headsign
      t.string :origin_stop
      t.time :origin_stop_time
      t.datetime :remote_updated_at

      t.timestamps
    end
  end
end
