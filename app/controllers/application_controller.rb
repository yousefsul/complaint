class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :logged_in?

=begin
store the current user to the value user_id in session
=end
  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])

  end

=begin
check if the current user logged in
=end
  def logged_in?
    !current_user.nil?
  end

end
