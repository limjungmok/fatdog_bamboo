class AddBPictureToBoards < ActiveRecord::Migration
  def change
    add_column :boards, :b_picture, :string
  end
end
