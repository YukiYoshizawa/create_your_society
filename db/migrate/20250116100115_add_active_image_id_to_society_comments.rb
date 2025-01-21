class AddActiveImageIdToSocietyComments < ActiveRecord::Migration[6.1]
  def change
    add_column :society_comments, :image_id, :string
  end
end
