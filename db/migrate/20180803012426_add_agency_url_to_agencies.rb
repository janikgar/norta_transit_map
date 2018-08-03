class AddAgencyUrlToAgencies < ActiveRecord::Migration[5.2]
  def change
    add_column :agencies, :agency_url, :string
  end
end
