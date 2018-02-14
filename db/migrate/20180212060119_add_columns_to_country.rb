class AddColumnsToCountry < ActiveRecord::Migration[5.0]
  def change
    add_column :countries, :capital, :string
    add_column :countries, :country_wiki, :string
    add_column :countries, :city_wiki, :string
  end
end
