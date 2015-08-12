class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show]
  before_action :correct_user, 	 only: [:show]

  def show
  	@user = User.find(params[:id])
  	@boards = Board.paginate(page: params[:page], :per_page => 5).all.order("created_at DESC")
  end

  private
    def logged_in_user
      unless logged_in?
        flash[:danger] = "로그인 하세요"
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end  
end
