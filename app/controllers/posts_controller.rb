class PostsController < ApplicationController
  before_action:find_post, only: [:show]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :context, :category, :status)
  end

  def find_post
    @post = Post.find([:id])
  end
end
