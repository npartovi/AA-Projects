class SubsController < ApplicationController

  before_action :require_login, except: [:index, :show]

  def index
    @subs = Sub.all
    render :index
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def create

    @sub = Sub.new(sub_params)
    @sub.user_id = current_user.id

    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def new
    @sub = Sub.new
  end

  def update
  end

  def edit
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description)
  end


end
