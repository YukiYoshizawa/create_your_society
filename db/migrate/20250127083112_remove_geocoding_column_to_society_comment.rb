class RemoveGeocodingColumnToSocietyComment < ActiveRecord::Migration[6.1]
  def change
    remove_column :societies, :longitude, :decimal
    remove_column :societies, :latitude, :decimal
  end
end
