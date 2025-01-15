class CreateSocieties < ActiveRecord::Migration[6.1]
  def change
    create_table :societies do |t|
      t.string :title
      t.text :introduction
      t.string :image_id
      t.integer :owner_id
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6

      t.timestamps
    end
  end
end
