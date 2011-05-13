class SessionsController < ApplicationController

  def create
    if user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to articles_path, :notice => 'Logged in successfully'
    else
      flash.now[:alert] = "Invalid login information"
      render new
    end
  end

  def destroy
    reset_session
    redirect_to login_path, :notice => "You successfully logged out"
  end
  
end
