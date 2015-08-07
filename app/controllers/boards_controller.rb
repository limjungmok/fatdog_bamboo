class BoardsController < ApplicationController
	autocomplete :board, :b_category
	def new
		@board = Board.new
	end

	def create
		@board = Board.new(board_params)


		if @board.save
			redirect_to root_path
		else
			flash.now[:danger]="해시태그 혹은 내용을 입력해주세요"
			render new_board_path
		end
	end

    def index
    	@ip = request.remote_ip
        if(params[:b_category])
            @boards = Board.paginate(page: params[:page], :per_page => 10).where("b_category = ? ", params[:b_category])
        elsif(params[:b_click_count])
            @boards = Board.paginate(page: params[:page], :per_page => 10).order("b_click_count DESC")
        elsif(params[:b_like])
            @boards = Board.paginate(page: params[:page], :per_page => 10).order("b_like DESC")
        elsif params[:search]
            @boards = Board.paginate(page: params[:page], :per_page => 10).search(params[:search])
        else
            @boards = Board.paginate(page: params[:page], :per_page =>10)
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
		redirect_to boards_path
	end

	def autocomplete
		if params[:term]
			like = "%".concat(params[:term].concat("%"))
			boards = Board.where("b_category like ?", like)
		else
			boards = Board.all
		end
		list = boards.map {|b| Hash[b_category: b.b_category]}
		render json: list
	end

	 def us_states
    ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado",
      "Connecticut", "Delaware", "District of Columbia", "Florida", "Georgia",
      "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky",
      "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota",
      "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire",
      "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota",
      "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina",
      "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia",
      "Washington", "West Virginia", "Wisconsin", "Wyoming"]
  end


	private
	def board_params
		params.require(:board).permit(:b_category, :b_content, :b_click_count, :b_like, :b_picture)
	end
end
