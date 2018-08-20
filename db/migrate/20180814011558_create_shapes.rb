class CreateShapes < ActiveRecord::Migration[5.2]
  def change
    create_table :shapes do |t|
      t.string :shape_pt_lat
      t.string :shape_pt_lon
      t.string :shape_id
      t.string :shape_pt_sequence

      t.timestamps
    end
  end
end
