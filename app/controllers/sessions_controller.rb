class SessionsController < ApplicationController
  def new
  end

  def create
    author = Author.find_by(email: params[:session][:email].downcase)
    if author && author.authenticate(params[:session][:password])
      log_in author
      params[:session][:remember_me] == '1' ? remember(author) : forget(author)
      redirect_to author
    else
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
