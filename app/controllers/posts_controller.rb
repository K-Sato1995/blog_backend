class PostsController < ApplicationController

  def index
    @categories = Category.all.includes(:posts)
    @recent_posts = Post.published
                        .includes(:category)
                        .order(created_at: :DESC)
                        .limit(5)
    if params[:category]
      @posts = Post.published
                   .includes(:category)
                   .where(category_id: params[:category].to_i)
                   .page(params[:page])
                   .order(score: :desc, created_at: :desc)
                   .per(12)

    else
      @posts = Post.published.includes(:category)
                   .search(params[:title])
                   .page(params[:page])
                   .order(score: :desc, created_at: :desc)
                   .per(12)
    end
  end

  def show
    @categories = Category.all.includes(:posts)
    @post = Post.find(params[:id])
    @recent_posts = Post.published
                        .includes(:category)
                        .order(created_at: :DESC)
                        .limit(5)
    @related_posts = @post.category
                          .posts
                          .published
                          .where
                          .not(id: @post.id)
                          .first(3)
  end

  def archive
    @posts = Post.all.published.order(created_at: :DESC)
    @categories = Category.all.includes(:posts)
    @recent_posts = Post.published
                        .includes(:category)
                        .order(created_at: :DESC)
                        .limit(5)
  end

  def about
    @categories = Category.all.includes(:posts)
    @recent_posts = Post.published
                        .includes(:category)
                        .order(created_at: :DESC)
                        .limit(5)
  end
end
