class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])

  	@boards = Board.all
  end
end
