class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:user_name],
      params[:user][:password]
    )

    if user
      flash[:success] = "Successfully logged in"
      redirect_to user_url(user)
    else
      flash.now[:errors] = ["wrong credentials"]
      render :new
    end
  end

  def destroy
    session[:session_token] = nil
    flash[:success] = "you have been logged out"
    redirect_to users_url
  end
end
