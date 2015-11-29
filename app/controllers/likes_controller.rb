class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @post.likes.create(user: current_user)
    
    render json: { new_likes_count: @post.likes.count }
    #redirect_to '/posts'
  end

  def destroy
    @post = Post.find(params[:post_id])
    like = Like.find(params[:id])
    like.destroy if like.user == current_user
    
    render json: { new_likes_count: @post.likes.count }
  end
end
