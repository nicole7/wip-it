class FavoritesController < ApplicationController
  def favorite
    @user = current_user
    @post = Post.find(params[:post_id])
    @user.to_favorite!(@post)
  end

  def un_favorite(post)
    @user = current_user
    @favorite = @user.favorite.find_by_post_id(params[:post_id])
    @post = Post.find(params[:post_id])
    @favorite.destroy!
  end
end