module Admin
  class AuthorsController < ApplicationController
    before_action :authenticate_author

    def show
      @author = Author.find(params[:id])
    end

    def new
      @author = Author.new
    end


    def create
      @author = Author.new(author_params)
      if @author.save
        redirect_to @author
      else
        render 'new'
      end
    end

    private

    def author_params
      params.require(:author).permit(:name, :email, :password, :password_confirmation)
    end

    def authenticate_author
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def correct_author
      @author = Author.find(params[:id])
      redirect_to(root_url) unless current_author?(@author)
    end
  end
end
