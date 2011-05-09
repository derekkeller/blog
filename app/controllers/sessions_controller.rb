class SessionsController < ApplicationController

  def create
    if @user.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to root_path, :notice => 'Logged in successfully'
    else
      flash.now[:alert] = "Invalid login information"
      render new
    end
  end


end
