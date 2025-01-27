class AddLatitudeAndLongitudeFromSocietyComments < ActiveRecord::Migration[6.1]
  def change
    add_column :society_comments, :address, :string, null: false, default: ""
    add_column :society_comments, :latitude, :float, null: false, default: 0
    add_column :society_comments, :longitude, :float, null: false, default: 0
  end
end
