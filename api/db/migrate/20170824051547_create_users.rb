class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :mobile
      t.string :password_digest
      t.string :authentication_token
      t.string :username

      t.timestamps
    end
    add_index(:users, :name)
    add_index(:users, :mobile)
    add_index(:users, :username)
  end
end
