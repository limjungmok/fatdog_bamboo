class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :u_pwd
      t.string :u_pwd_confirmation
      t.boolean :u_admin

      t.timestamps null: false
    end
  end
end
