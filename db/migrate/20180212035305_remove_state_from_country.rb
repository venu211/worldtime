class RemoveStateFromCountry < ActiveRecord::Migration[5.0]
  def change
    remove_column :countries, :state, :string
  end
end
