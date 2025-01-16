class CreateSocietyComments < ActiveRecord::Migration[6.1]
  def change
    create_table :society_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :society_id

      t.timestamps
    end
  end
end
