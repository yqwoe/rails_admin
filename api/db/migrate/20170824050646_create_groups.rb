class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :type_id

      t.timestamps
    end
    add_index(:groups, :name)
    add_index(:groups, [ :name, :type_id])
  end
end
