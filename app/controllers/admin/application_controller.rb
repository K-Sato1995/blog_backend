module Admin
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include SessionsHelper
    layout 'application'
  end
end
