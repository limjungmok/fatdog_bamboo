class AddUIdPasswordDigestToUsers < ActiveRecord::Migration
  def change
    add_column :users, :u_id, :string
    add_column :users, :password_digest, :string
  end
end
