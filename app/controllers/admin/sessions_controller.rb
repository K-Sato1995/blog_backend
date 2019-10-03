module Admin
  class SessionsController < ApplicationController
    def new; end

    def create
      author = Author.find_by(email: params[:session][:email].downcase)
      if author && author.authenticate(params[:session][:password])
        log_in author
        params[:session][:remember_me] == '1' ? remember(author) : forget(author)
        flash[:success] = 'Welcome Back!!'
        redirect_to admin_posts_path
      else
        flash.now[:danger] = 'Email address or password is incorrect'
        render 'new'
      end
    end

    def destroy
      log_out
      redirect_to root_url
    end
  end
end