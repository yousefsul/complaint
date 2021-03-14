class SessionsController < ApplicationController
  def new; end

=begin
search mongodb by email and password
=end
  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  # rescue Mongoid::Errors::DocumentNotFound
  #   # Ignored
  end


  def login
  end

=begin
delete the user_id from session when logout
and redirect to login page
=end
  def destroy
    session[:user_id] = nil
    redirect_to '/login', notice: 'Logged out!'
  end
end
