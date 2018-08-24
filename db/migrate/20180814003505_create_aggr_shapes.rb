class CreateAggrShapes < ActiveRecord::Migration[5.2]
  def change
    create_table :aggr_shapes do |t|
      t.string :aggr_shape_id
      t.text :shape_ids
      t.timestamps
    end
    add_index :aggr_shapes, :aggr_shape_id, unique: true
  end
end
