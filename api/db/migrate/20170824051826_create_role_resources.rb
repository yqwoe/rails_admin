class CreateRoleResources < ActiveRecord::Migration[5.1]
  def change
    create_table :role_resources do |t|
      t.integer :role_id
      t.integer :resource_id

      t.timestamps
    end
    add_index(:role_resources, [ :role_id, :resource_id ])
  end
end
