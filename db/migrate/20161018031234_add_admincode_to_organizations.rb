class AddAdmincodeToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :admincode, :string
  end
end
