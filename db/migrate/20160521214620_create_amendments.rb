class CreateAmendments < ActiveRecord::Migration
  def change
    create_table :amendments do |t|
      t.string :title
      t.boolean :passed
      t.text :body
      t.references :resolution, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
