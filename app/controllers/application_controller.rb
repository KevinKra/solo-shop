class ApplicationController < ActionController::Base
  before_action :current_user
  helper_method :current_user, :user_role

  def not_found
    render "../views/errors/404.html.erb", layout: false, status: '404'
  end

  def current_user 
    @current_user ||= User.find(session[:user_id]) if session[:user_id] != nil
  end

  def user_role(type)
    @current_user.role == type if @current_user
  end
end
