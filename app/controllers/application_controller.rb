class ApplicationController < ActionController::Base

    def logged_in?
    session[:user_id] != nil
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def redirect_unless_logged_in
    redirect_to new_session_path unless logged_in?
  end

  def redirect_unless_owner(user)
    redirect_to root_path unless current_user == user
  end

  def authorized?(user)
    current_user == user
  end

  def find_and_ensure_user(id)
    user = User.find_by(id: id)
    redirect_to '/404' if user.nil? || user != current_user
  end


  # protect_from_forgery with: :exception
  # before_action :authenticate_user!

  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end


end
