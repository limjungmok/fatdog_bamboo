class AddBoardIdToReplies < ActiveRecord::Migration
  def change
    add_column :replies, :board_id, :integer
  end
end
