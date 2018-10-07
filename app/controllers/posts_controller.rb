class PostsController < ApplicationController

  def index
    @categories = Category.all
    @recent_posts = Post.includes(:category).order(created_at: :DESC).limit(5)

    if params[:category]
      @posts = Post.published.includes(:category).where(category_id: params[:category].to_i).page(params[:page]).per(12).order(created_at: :desc)
    else
      @posts = Post.published.includes(:category).search(params[:title]).page(params[:page]).per(12).order(created_at: :desc)
    end
  end

  def show
    @categories = Category.all
    @recent_posts = Post.includes(:category).order(created_at: :DESC).limit(5)
    @post = Post.find(params[:id])
    @related_posts = @post.category.posts.where.not(id: @post.id).first(3)
  end

  def archive
    @posts = Post.all.order(created_at: :DESC)
    @categories = Category.all
    @recent_posts = Post.includes(:category).order(created_at: :DESC).limit(5)
  end

  def about
    @categories = Category.all
    @recent_posts = Post.includes(:category).order(created_at: :DESC).limit(5)
  end
end
