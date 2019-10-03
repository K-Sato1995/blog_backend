module Admin
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authenticate_author
    include SessionsHelper
    layout "application"

    private

    def authenticate_author
      unless logged_in?
        redirect_to login_url
        flash[:danger] = 'Please log in.'
      end
    end
  end
end
