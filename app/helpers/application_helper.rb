module ApplicationHelper
  def authenticate_author
    unless logged_in?
      redirect_to admin_login_path
      flash[:danger] = 'Please log in.'
    end
  end
end
