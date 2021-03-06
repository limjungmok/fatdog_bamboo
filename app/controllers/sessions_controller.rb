class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(u_id: params[:session][:id].downcase)
    if user
      log_in(user)
  	  redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
   	end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end

