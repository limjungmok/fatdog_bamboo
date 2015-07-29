class BoardsController < ApplicationController
	
	def new
		@board = Board.new
	end

	def create
		@board = Board.new(board_params)
		if @board.save
			redirect_to root_path
		else
			flash.now[:danger]="카테고리를 선택해주세요"
			redirect_to new_board_path
		end
	end

	def index
		if(params[:b_category])
			@boards = Board.where("b_category = ? ", params[:b_category])
		elsif(params[:b_click_count])
			@boards = Board.order("b_click_count DESC")
		elsif(params[:b_like])
			@boards = Board.order("b_like DESC")
		else
			@boards = Board.all
		end
	end

	def show
		@board = Board.find(params[:id])
		@board.increment! :b_click_count
	end

	def edit
		
	end

	def edit_like
		@board = Board.find(params[:id])
		@board.increment! :b_like
	end

	def update
		
	end

	def destroy
		Board.find(params[:id]).destroy
		redirect_to boards_path
	end


	private
	def board_params
		params.require(:board).permit(:b_category, :b_content, :b_click_count, :b_like, :b_picture)
	end
end
