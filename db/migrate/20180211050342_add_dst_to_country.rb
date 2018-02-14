class AddDstToCountry < ActiveRecord::Migration[5.0]
  def change
    add_column :countries, :dst, :boolean
  end
end
