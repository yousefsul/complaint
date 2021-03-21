class SessionsController < ApplicationController
  def new; end

=begin
search mongodb by email and password
=end
  def create
    @user = User.find_by(email: params[:email])
    respond_to do |format|
      if @user&.authenticate(params[:password])
        session[:user_id] = @user.id
        format.html { redirect_to root_path, notice: 'Login Successfully' }
        format.json { render json: @user, status: :ok }
      else
        format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @user.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

=begin
delete the user_id from session when logout
and redirect to login page
=end
  def destroy
    session.delete(:user_id)
    redirect_to login_path, notice: 'Logged out successfully'

  end
end
