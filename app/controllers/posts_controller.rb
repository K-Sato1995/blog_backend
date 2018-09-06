class PostsController < ApplicationController
  
  def index
    @categories = Category.all
    if params[:category]
      @posts = Post.category_search(params[:category])
    else
      @posts = Post.search(params[:title])
    end
  end

  def show
    @post = Post.find(params[:id])
  end
end
