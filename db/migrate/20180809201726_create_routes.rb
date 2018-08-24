class CreateRoutes < ActiveRecord::Migration[5.2]
  def change
    create_table :routes do |t|
      t.string :route_id
      t.string :agency_id
      t.string :route_short_name
      t.string :route_long_name
      t.text :route_desc
      t.integer :route_type # convert to integer
      t.string :route_url
      t.string :route_color
      t.string :route_text_color
      t.integer :route_sort_order # convert to integer
      t.timestamps
    end
    add_index :routes, :route_id, unique: true
  end
end
