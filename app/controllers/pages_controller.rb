class PagesController < ApplicationController
  def home
  	@boards = Board.all
  	@click_count_list = Board.order("b_click_count DESC")
  end
end
