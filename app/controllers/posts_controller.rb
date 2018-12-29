class PostsController < ApplicationController
  before_action :recent_posts_and_categories

  def index
    @posts = Post.published.includes(:category).search(title: params[:title], category: params[:category]).page(params[:page]).order(score: :desc, created_at: :desc).per(12)
  end

  def show
    @post = Post.find(params[:id])
    @post.update(page_views: @post.page_views += 1)
    @related_posts = @post.category.posts.published.where.not(id: @post.id).first(3)
  end

  def archive
    @posts = Post.all.published.order(created_at: :DESC)
  end

  private

  def recent_posts_and_categories
    @recent_posts = Post.published.includes(:category).order(created_at: :DESC).limit(5)
    @categories = Category.all.includes(:posts)
  end
end
