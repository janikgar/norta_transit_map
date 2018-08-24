class CreateCalendars < ActiveRecord::Migration[5.2]
  def change
    create_table :calendars do |t|
      t.string :service_id
      # convert ALL days to boolean
      t.boolean :monday
      t.boolean :tuesday
      t.boolean :wednesday
      t.boolean :thursday
      t.boolean :friday
      t.boolean :saturday
      t.boolean :sunday
      # end days
      t.date :start_date # convert
      t.date :end_date # convert
      t.timestamps
    end
    add_index :calendars, :service_id, unique: true
  end
end
