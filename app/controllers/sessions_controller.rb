class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    # byebug

    if user && user.authenticate(params[:session][:password])
      flash[:notice] = "Successfully logged in"
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash.now[:notice] = "Wrong input"
      render :new
    end
  end
end
