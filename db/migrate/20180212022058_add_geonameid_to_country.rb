class AddGeonameidToCountry < ActiveRecord::Migration[5.0]
  def change
    add_column :countries, :geonameid, :string
  end
end
