class CreateShapes < ActiveRecord::Migration[5.2]
  def change
    create_table :shapes do |t|
      t.float :shape_pt_lat
      t.float :shape_pt_lon
      t.integer :shape_pt_sequence
      t.float :shape_dist_travled

      t.timestamps
    end
  end
end
