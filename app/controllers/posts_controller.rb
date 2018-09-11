class PostsController < ApplicationController

  def index
    @categories = Category.all
    @recent_posts = Post.order(created_at: :DESC).limit(5)

    if params[:category]
      @posts = Post.published.category_search(params[:category]).page(params[:page]).per(4).order(created_at: :desc)
    else
      @posts = Post.published.search(params[:title]).page(params[:page]).per(4).order(created_at: :desc)
    end
  end

  def show
    @post = Post.find(params[:id])
  end
end
