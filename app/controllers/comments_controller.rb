class CommentsController < ApplicationController

  before_action :authenticate_user!

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user

    if @post.save
      redirect_to '/posts'
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def update
    comment = Comment.find(params[:id])
    comment.update(comment_params) if comment.user == current_user
    flash[:notice] = 'Comment updated succesfully'

    redirect_to '/posts'
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy if comment.user == current_user
    flash[:notice] = 'Comment deleted succesfully'  

    redirect_to '/posts'
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
