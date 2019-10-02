module SessionsHelper
  def log_in(author)
    session[:author_id] = author.id
  end

  def current_author?(author)
    author == current_author
  end

  def current_author
    if (author_id = session[:author_id])
      @current_author ||= User.find_by(id: author_id)
    elsif (author_id = cookies.signed[:author_id])
      author = User.find_by(id: author_id)
      if author && author.authenticated?(cookies[:remember_token])
        log_in author
        @current_author = author
      end
    end
  end

  def logged_in?
    !current_author.nil?
  end

  # Make the author's session permanent
  def remember(author)
    author.remember
    cookies.permanent.signed[:author_id] = author.id
    cookies.permanent[:remember_token] = author.remember_token
  end

  # Delete the permanent session
  def forget(author)
    author.forget
    cookies.delete(:author_id)
    cookies.delete(:remember_token)
  end

  def log_out
    forget(current_author)
    session.delete(:author_id)
    @current_author = nil
  end
end
