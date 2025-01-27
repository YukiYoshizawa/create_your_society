class AddGeocodingC1olumnToSociety < ActiveRecord::Migration[6.1]
  def change
    add_column :societies, :address, :string, null: false, default: ""
    add_column :societies, :latitude, :float, null: false, default: 0
    add_column :societies, :longitude, :float, null: false, default: 0
  end
end
