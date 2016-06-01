class AddColumnToResolutionsUsers < ActiveRecord::Migration
  def change
  	add_column :resolutions_users, :user_id, :integer
    add_column :resolutions_users, :resolution_id, :integer
  end
end
