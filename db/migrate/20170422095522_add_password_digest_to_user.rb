class AddPasswordDigestToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :password_digest, :string
    add_column :users, :token, :string
    add_index :users, :token
  end
end
