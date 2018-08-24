class CreateShapes < ActiveRecord::Migration[5.2]
  def change
    create_table :shapes do |t|
      t.float :shape_pt_lat # convert
      t.float :shape_pt_lon # convert
      t.string :shape_id
      t.integer :shape_pt_sequence # convert
      t.float :shape_dist_traveled # convert

      t.timestamps
    end
  end
end
