module SessionsHelper
  def log_in(author)
    session[:author_id] = author.id
  end

  def current_author
    @author ||= Author.find_by(id: session[:author_id]) if session[:author_id]
  end

  def logged_in?
    !current_author.nil?
  end

  def log_out
    session.delete(:author_id)
    @current_author = nil
  end
end
