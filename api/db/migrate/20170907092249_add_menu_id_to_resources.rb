class AddMenuIdToResources < ActiveRecord::Migration[5.1]
  def change
    add_column :resources, :menu_id, :integer

    add_index(:resources, :menu_id)
  end
end
