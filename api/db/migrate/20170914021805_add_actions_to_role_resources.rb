class AddActionsToRoleResources < ActiveRecord::Migration[5.1]
  def change
    add_column :role_resources, :actions, :string,:array => true
    add_index :role_resources, :actions
  end
end
