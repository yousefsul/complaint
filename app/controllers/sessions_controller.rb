class SessionsController < ApplicationController
  def new; end

=begin
search mongodb by email and password
=end
  def create
    @user = User.where(:email => params[:email])
    if @user.present? && @user.authenticate(:password => params[:password])
      session[:user_id] = @user.id
      redirect_to complains_path
    else
      render :new
    end

  end

=begin
delete the user_id from session when logout
and redirect to login page
=end
  def destroy
    session.delete(:user_id)
    redirect_to '/login', notice: 'Logged out!'
  end
end
