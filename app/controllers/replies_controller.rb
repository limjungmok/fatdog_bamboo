class RepliesController < ApplicationController

	def create
		@board = Board.find(params[:board_id])
		@reply = @board.replies.create(reply_params)
		if @reply.save
    		redirect_to board_path(@board)
    	else
    		redirect_to root_url
    	end
	end

	def index
		
	end

	private

	def reply_params
		params.require(:reply).permit(:r_content)
	end

end
