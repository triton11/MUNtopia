class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_hash
      t.string :country
      t.string :email

      t.timestamps null: false
    end
  end
end
