class AddTagsToRoutes < ActiveRecord::Migration[5.2]
  def change
    add_column :routes, :tags, :text
  end
end
