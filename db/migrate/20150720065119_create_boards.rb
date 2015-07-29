
class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :b_category
      t.text :b_content
      t.string :b_pwd
      t.integer :b_click_count, default: "1"
      t.integer :b_like

      t.timestamps null: false
    end
  end
end
