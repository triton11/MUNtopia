class CreateResolutionsUsers < ActiveRecord::Migration
  def change
    create_table :resolutions_users do |t|

      t.timestamps null: false
    end
  end
end
