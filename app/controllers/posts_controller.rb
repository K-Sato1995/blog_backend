class PostsController < ApplicationController

  def index
    @categories = Category.all
    @recent_posts = Post.order(created_at: :DESC).limit(5)

    if params[:category]
      @posts = Post.published.category_search(params[:category]).page(params[:page]).per(12).order(created_at: :desc)
    else
      @posts = Post.published.search(params[:title]).page(params[:page]).per(12).order(created_at: :desc)
    end
  end

  def show
    @categories = Category.all
    @recent_posts = Post.order(created_at: :DESC).limit(5)
    @post = Post.find(params[:id])
    @related_posts = @post.category.posts.where.not(id: @post.id).first(2)
  end
end
