class AddGeocodingColumnToSociety < ActiveRecord::Migration[6.1]
  def change
    add_column :societies, :address, :string
  end
end
