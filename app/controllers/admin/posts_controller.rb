module Admin
  class PostsController < Admin::ApplicationController
    include ApplicationHelper
    before_action :authenticate_author
    before_action :find_post, only: [:edit, :update, :destroy]

    def index
      @q = Post.ransack(params[:q])
      @posts = @q.result(distinct: true).includes(:category).status_check(status: params[:status]).order('title ASC')

      case params[:status]
      when 'draft' then @draft = 'active'
      when 'confidential' then @confidential = 'active'
      when 'published' then @published = 'active'
      end
    end

    def new
      @post = Post.new
    end

    def create
      @post = current_author.posts.new(post_params)
      tag_list = params[:post][:tag_list].split(',').map do |name|
        Tag.where(name: name.strip).first_or_create!
      end
      @post.tags = tag_list

      if @post.save
        flash[:success] = 'Your post was successfully created'
        redirect_to admin_posts_path
      else
        render 'new'
      end
    end

    def update
      @post.update(post_params)
      tag_list = params[:post][:tag_list].split(',').map do |name|
        Tag.where(name: name.strip).first_or_create!
      end
      @post.tags = tag_list
      if @post.save
        flash[:warning] = 'The post was successfully updated'
        redirect_to admin_posts_path
      else
        render 'edit'
      end
    end

    def destroy
      @post.destroy
      flash[:danger] = 'The post was successfully deleted'
      redirect_to admin_posts_path
    end

    private

    def post_params
      columns = Post.column_names - %i[created_at updated_at]
      params.require(:post).permit(columns, :category_name)
    end

    def find_post
      @post = Post.find_by(slug: params[:id])
    end

    def authenticate_author
      unless logged_in?
        redirect_to admin_login_path
        flash[:danger] = 'Please log in.'
      end
    end
  end
end
