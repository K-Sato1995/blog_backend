class PostsController < ApplicationController
  before_action:authenticate_user!, only: [ :new, :edit, :update, :destroy ]
  before_action:find_post, only: [ :show, :edit, :update, :destroy ]

  def index
    @categories = Category.all
    if params[:category]
      @posts = Post.category_search(params[:category])
    else
      @posts = Post.search(params[:title])
    end
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
    params.require(:post).permit(:title, :context, :category, :status, :image, :category_name, :user_id).merge(user_id: current_user.id)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
