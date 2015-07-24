class RemovePictureFromBoards < ActiveRecord::Migration
  def change
    remove_column :boards, :picture, :string
  end
end
