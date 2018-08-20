class AddColorsToRoute < ActiveRecord::Migration[5.2]
  def change
    add_column :routes, :color, :string
    add_column :routes, :text_color, :string
  end
end
