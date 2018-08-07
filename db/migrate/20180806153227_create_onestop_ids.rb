class CreateOnestopIds < ActiveRecord::Migration[5.2]
  def change
    create_table :onestop_ids do |t|
      t.string :name
      t.string :vehicle_type
      t.string :color
      t.text :geometry
      t.string :wheelchair_accessible
      t.string :bikes_allowed

      t.timestamps
    end
  end
end
