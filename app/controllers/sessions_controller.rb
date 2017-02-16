class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    # byebug

    if user && user.authenticate(params[:session][:password])
      flash[:notice] = "Successfully logged in"
      session[:user_id] = user.id
      redirect_to user_path(current_user)
    else
      flash.now[:notice] = "Wrong input"
      render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = "Successfully logged out!"
    redirect_to login_path
  end
end
