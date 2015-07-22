class PagesController < ApplicationController
  def home
  	@boards = Board.all
  end

  def board
  end

  def write	
  end


  def getSlideBoard
  	@boards = Board.all
  	@slide_board = boards.find(params[:click_count])
  end
end
