class CreateUserSocieties < ActiveRecord::Migration[6.1]
  def change
    create_table :user_societies do |t|
      t.references :user, foreign_key: true
      t.references :society, foreign_key: true

      t.timestamps
    end
  end
end
