class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  helper_method :logged_in? ,:current_user
  private

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    return unless session[:user_id]
    @current_user ||=User.find(session[:user_id])
  end

end
