class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save 
      redirect_to posts_path
    else
      render :new
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy if post.user == current_user

    redirect_to '/posts'
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    
    redirect_to '/posts'
  end

  def post_params
    params.require(:post).permit(:image, :caption)
  end
end
