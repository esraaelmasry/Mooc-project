class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def current_normal_user 
  	@current_normal_user = User.find(session[:user]) if session[:user]
  end
end
