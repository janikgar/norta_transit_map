class ChangeFeedVersionShaInScheduleStops < ActiveRecord::Migration[5.2]
  def change
    add_column :schedule_stops, :feed_version_sha1, :string
    remove_column :schedule_stops, :feed_version_sha
  end
end
