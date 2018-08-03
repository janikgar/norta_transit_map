class AddAgencyLangToAgency < ActiveRecord::Migration[5.2]
  def change
    remove_column :agencies, :agency_agency_lang
    add_column :agencies, :agency_lang, :string
  end
end
