class CreateRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :roles do |t|
      t.string :name
      t.string :title
      t.integer :resource_id
      t.string :resource_type

      t.timestamps
    end
    add_index(:roles, :name)
    add_index(:roles, :title)
  end
end
