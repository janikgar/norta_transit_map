class CreateShapesTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :shapes_trips do |t|
      t.references :shape, foreign_key: true
      t.references :trip, foreign_key: true
    end
  end
end
