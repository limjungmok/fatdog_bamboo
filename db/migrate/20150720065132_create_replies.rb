class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.string :r_pwd
      t.text :r_content

      t.timestamps null: false
    end
    add_index :replies, [:board_id, :created_at]
  end
end
