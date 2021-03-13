class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :logged_in?


  def current_user
    User.find(id: session[:user_ids])
  end

  def logged_in?
    !current_user.nil?
  end

end
