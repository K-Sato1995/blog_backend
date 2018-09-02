class PostsController < ApplicationController
  before_action:find_post, only: [ :show, :edit, :update, :destroy ]
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

  def update
    @post.update(post_params)
    if @post.save
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :context, :category, :status)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
