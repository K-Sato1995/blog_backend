class PostsController < ApplicationController

  def index
    @categories = Category.all
    if params[:category]
      @posts = Post.published.category_search(params[:category])
    else
      @posts = Post.published.search(params[:title])
    end
  end

  def show
    @post = Post.find(params[:id])
  end
end
