class PagesController < ApplicationController
  def home
  	@boards = Board.all
  end

  def getSlideBoard
  	@boards = Board.all
  	@slide_board = boards.find(params[:click_count])
  end
end
