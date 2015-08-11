class BoardsController < ApplicationController
	autocomplete :board, :b_category
	def new
		@board = Board.new
	end

	def create
		@board = Board.new(board_params)
		@board.b_content = nil
		if @board.b_category == '#'
			flash[:danger] = "해시태그를 입력해라"
			redirect_to new_board_path
		elsif @board.b_category != '#' && @board.b_content.nil?
			flash[:danger] = "내용 쓰고 다시해라"
			redirect_to new_board_path
		else
			@board.save
			redirect_to root_path
		end
	end

    def index
        if(params[:b_category])
            @boards = Board.paginate(page: params[:page], :per_page => 10).where("b_category = ? ", params[:b_category])
        elsif(params[:b_click_count])
            @boards = Board.paginate(page: params[:page], :per_page => 10).order("b_click_count DESC")
        elsif(params[:b_like])
            @boards = Board.paginate(page: params[:page], :per_page => 10).order("b_like DESC")
        elsif params[:search]
            @boards = Board.paginate(page: params[:page], :per_page => 10).search(params[:search])
        else
            @boards = Board.paginate(page: params[:page], :per_page =>10).order("created_at DESC")
        end
    end

	def show
		@board = Board.find(params[:id])
	end

	def upClick
		@board = Board.find(params[:id])
		@board.increment! :b_click_count
	end

	def edit
		
	end

	def like
		@board = Board.find(params[:id])
		@board.increment! :b_like
	end

	def unlike
		@board = Board.find(params[:id])
		@board.decrement! :b_like
	end

	def update
		
	end

	def destroy
		Board.find(params[:id]).destroy
		redirect_to :back
	end

	private
	def board_params
		params.require(:board).permit(:b_category, :b_content, :b_click_count, :b_like, :b_picture)
	end
end
