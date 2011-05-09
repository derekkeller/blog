class UsersController < ApplicationController

  before_filter :authenticate, :only => [:edit, :update]

  def index
    @user = User.all
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to articles_path, :notice => 'Successfully created a user'
    else
      render :new
    end
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to articles_path, :notice => 'Successfully updated the user'
    else
      render :edit
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

end
