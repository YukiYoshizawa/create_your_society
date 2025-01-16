class AddImageIdToSocietyComments < ActiveRecord::Migration[6.1]
  def change
    add_column :society_comments, :latitude, :decimal, precision: 10, scale: 6
    add_column :society_comments, :longitude, :decimal, precision: 10, scale: 6
  end
end
