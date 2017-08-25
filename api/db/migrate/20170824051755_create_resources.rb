class CreateResources < ActiveRecord::Migration[5.1]
  def change
    create_table :resources do |t|
      t.string :name
      t.integer :parent_id
      t.string :api_url
      t.string :web_url
      t.string :key
      t.string :icon

      t.timestamps
    end
    add_index(:resources, :name)
    add_index(:resources, :parent_id)
    add_index(:resources, :api_url)
    add_index(:resources, :web_url)
    add_index(:resources, :key)
    add_index(:resources, :icon)
  end
end
