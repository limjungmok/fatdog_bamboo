class BoardsController < ApplicationController
	
	def new
		@board = Board.new
	end

	def create
		@board = Board.new(board_params)
		if @board.save
			redirect_to root_path
		end
	end

	def index
		@boards = Board.all
	end

	def show

	end

	def edit
		
	end

	def update
		
	end

	def destroy
		
	end


	private

	def board_params
		params.require(:board).permit(:b_category, :b_content)
	end
end
