class AddCreatorToResolution < ActiveRecord::Migration
  def change
    add_column :resolutions, :creator, :integer
  end
end
