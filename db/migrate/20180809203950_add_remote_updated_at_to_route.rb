class AddRemoteUpdatedAtToRoute < ActiveRecord::Migration[5.2]
  def change
    add_column :routes, :remote_updated_at, :datetime
  end
end
