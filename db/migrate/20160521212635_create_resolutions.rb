class CreateResolutions < ActiveRecord::Migration
  def change
    create_table :resolutions do |t|
      t.string :title
      t.boolean :passed
      t.text :body

      t.timestamps null: false
    end
  end
end
