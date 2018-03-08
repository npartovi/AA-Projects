class UsersController < ApplicationController


  def new
    @user = User.new
    render :new
  end

  def index
    @users = User.all
    render :index
  end

  def show
    render :show
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      flash[:success] = 'Successfully logged in '
      redirect_to user_url(@user)
    else
        render json: @user.errors.full_messages, status: 422
    end
  end


  private

  def user_params
    params.require(:user).permit(:user_name,:password)
  end
end
