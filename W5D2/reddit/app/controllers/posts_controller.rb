class PostsController < ApplicationController

  def new
    @post = Post.new
    @post.sub_id = params[:sub_id]
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.sub_id = params[:sub_id]

    if @post.save
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def post_params
    params.require(:post).permit(:title, :url, :content, :sub_id)
  end

  def show
    @post = Post.find(params[:id])
  end
end
