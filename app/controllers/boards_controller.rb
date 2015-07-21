class BoardsController < ApplicationController
	
	def new

	end

	def create
		
	end

	def index
		@board = Board.new
	end

	def show
		@boards = Board.all
	end

	def edit
		
	end

	def update
		
	end

	def destroy
		
	end

end
