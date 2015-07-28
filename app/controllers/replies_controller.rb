class RepliesController < ApplicationController

	def create
		@reply = current_board.replies.build(reply_params)
		if @micropost.save
			redirect_to root_path
		end
	end

	def index
		
	end

	private

	def reply_params
		params.require(:reply).permit(:r_content)
	end

	def current_board
		@reply = current_board.replies.find_by(id: params[:id])
	end
end
