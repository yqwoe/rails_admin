class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :type_id
      t.integer :parent_id

      t.timestamps
    end
    add_index(:groups, :name)
    add_index(:groups, :type_id)
    add_index(:groups, :parent_id)
    add_index(:groups, [ :name, :type_id,:parent_id])
  end
end
