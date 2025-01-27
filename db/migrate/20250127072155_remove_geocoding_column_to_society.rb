class RemoveGeocodingColumnToSociety < ActiveRecord::Migration[6.1]
  def change
    remove_column :societies, :address, :string
    remove_column :societies, :longitude, :decimal
    remove_column :societies, :latitude, :decimal
  end
end
