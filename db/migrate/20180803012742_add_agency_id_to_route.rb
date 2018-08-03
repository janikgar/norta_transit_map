class AddAgencyIdToRoute < ActiveRecord::Migration[5.2]
  def change
    add_reference :routes, :agency, foreign_key: true
  end
end
