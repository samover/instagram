class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    @post.save

    redirect_to '/posts'
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
