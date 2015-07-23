class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(u_id: params[:session][:id].downcase)
  	log_in(user)
  	if user
  		redirect_to user
  	end
  end

  def destroy
  end
end
