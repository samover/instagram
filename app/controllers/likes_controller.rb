class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @post.likes.create(user: current_user)

    redirect_to '/posts'
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy if like.user == current_user
    
    redirect_to '/posts'
  end
end
