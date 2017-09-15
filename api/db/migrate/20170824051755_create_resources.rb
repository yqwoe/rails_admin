class CreateResources < ActiveRecord::Migration[5.1]
  def change
    create_table :resources do |t|
      t.string :name
      t.string :url, :null => true, :index => true
      t.string :key
      t.string :icon
      t.integer :parent_id, :null => true, :index => true


      t.timestamps
    end
    add_index(:resources, :name)
    add_index(:resources, :key)
  end
end
