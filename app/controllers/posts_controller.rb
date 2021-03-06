class PostsController < ApplicationController
  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    current_user.posts << @post

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

 def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params[:post].permit(:recipe_name, :label, :cautions, :ingredientLines, :ingredients, :totalNutrients, :bookmarked))
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:recipe_name, :label, :cautions, :ingredientLines, :ingredients, :totalNutrients, :bookmarked, :user_id)
  end
end