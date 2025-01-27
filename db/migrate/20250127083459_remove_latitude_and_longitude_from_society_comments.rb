class RemoveLatitudeAndLongitudeFromSocietyComments < ActiveRecord::Migration[6.1]
  def change
    remove_column :society_comments, :latitude, :decimal
    remove_column :society_comments, :longitude, :decimal
  end
end
