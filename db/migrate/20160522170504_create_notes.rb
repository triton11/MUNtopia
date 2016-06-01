class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.text :body
      t.integer :reciever
      t.integer :sender

      t.timestamps null: false
    end
  end
end
